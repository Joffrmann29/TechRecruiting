//
//  AddMessageViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/4/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AddMessageViewController.h"

@interface AddMessageViewController ()

@end

@implementation AddMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.2);
    [self layoutForIphone6PlusWithContentSize:self.scrollView.contentSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)layoutForIphone6PlusWithContentSize:(CGSize)contentSize
{
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 294, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    _firstNameField.text = _prospect[FirstName];
    [_scrollView addSubview:_firstNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 294, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    _emailField.text = _prospect[Email];
    [_scrollView addSubview:_emailField];
    
    _subjectField = [[UITextField alloc]initWithFrame:CGRectMake(60, _emailField.frame.origin.y+94, 294, 30)];
    _subjectField.placeholder = @"E-mail";
    _subjectField.textAlignment = NSTextAlignmentCenter;
    _subjectField.layer.borderWidth = 1.0;
    _subjectField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _subjectField.layer.cornerRadius = 10.0;
    _subjectField.clipsToBounds = YES;
    _subjectField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_subjectField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _subjectField.frame.origin.y+94, 294, 200)];
    _messageTextView.layer.borderWidth = 1.0;
    _messageTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _messageTextView.layer.cornerRadius = 10.0;
    _messageTextView.clipsToBounds = YES;
    _messageTextView.backgroundColor = [UIColor whiteColor];
    _messageTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
     _messageTextView.text = @"Enter Message ...";
    [_scrollView addSubview:_messageTextView];
    
    [self setTextFieldDelegates];
}

/* UITextView Delegate method. This method is triggered when the user types a new character in the textView. */
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    /* Test if the entered text is a return. If it is we tell textView to dismiss the keyboard and then we stop the textView from entering in additional information as text. This is not a perfect solution because users cannot enter returns in their text and if they paste text with a return items after the return will not be added. For the functionality required in this project this solution works just fine. */
    if ([text isEqualToString:@"\n"]){
        [self.messageTextView resignFirstResponder];
        return NO;
    }
    else return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _messageTextView.text = nil;
}

-(void)setTextFieldDelegates
{
    _firstNameField.delegate = self;
    _subjectField.delegate = self;
    _emailField.delegate = self;
    _messageTextView.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelSend:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendEmailToProspect:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate sendMessageWithFields:_firstNameField.text andEmail:_emailField.text andSubject:_subjectField.text andBody:_messageTextView.text withSender:sender];
    }];
}

@end
