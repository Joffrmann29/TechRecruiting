//
//  AddMessageViewController.m
//  TechRecruiting
//
//  Created by Augustus Wilson on 6/4/15.
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
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.3);
        //call layout method for Iphone 6 Plus
        [self layoutForIphone6PlusWithContentSize:self.scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        [self layoutForIPhone4S];
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)sender {
//    if (sender.contentOffset.x != 0) {
//        CGPoint offset = sender.contentOffset;
//        offset.x = 0;
//        sender.contentOffset = offset;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
    [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
}

-(void)layoutForIphone5WithContentSize:(CGSize)contentSize
{
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(42, 212, 255, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    _firstNameField.text = _prospect[FirstName];
    [_scrollView addSubview:_firstNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(42, _firstNameField.frame.origin.y+94, 255, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    _emailField.text = _prospect[Email];
    [_scrollView addSubview:_emailField];
    
    _subjectField = [[UITextField alloc]initWithFrame:CGRectMake(42, _emailField.frame.origin.y+94, 255, 30)];
    _subjectField.placeholder = @"Subject";
    _subjectField.textAlignment = NSTextAlignmentCenter;
    _subjectField.layer.borderWidth = 1.0;
    _subjectField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _subjectField.layer.cornerRadius = 10.0;
    _subjectField.clipsToBounds = YES;
    _subjectField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_subjectField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(42, _subjectField.frame.origin.y+94, 255, 200)];
    _messageTextView.layer.borderWidth = 1.0;
    _messageTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _messageTextView.layer.cornerRadius = 10.0;
    _messageTextView.clipsToBounds = YES;
    _messageTextView.backgroundColor = [UIColor whiteColor];
    _messageTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _messageTextView.text = @"Enter Message ...";
    _messageTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_messageTextView];
    
    [self setTextFieldDelegates];
}

-(void)layoutForIPhone6
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 255, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    _firstNameField.text = _prospect[FirstName];
    [_scrollView addSubview:_firstNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 255, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    _emailField.text = _prospect[Email];
    [_scrollView addSubview:_emailField];
    
    _subjectField = [[UITextField alloc]initWithFrame:CGRectMake(60, _emailField.frame.origin.y+94, 255, 30)];
    _subjectField.placeholder = @"Subject";
    _subjectField.textAlignment = NSTextAlignmentCenter;
    _subjectField.layer.borderWidth = 1.0;
    _subjectField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _subjectField.layer.cornerRadius = 10.0;
    _subjectField.clipsToBounds = YES;
    _subjectField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_subjectField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(62, _subjectField.frame.origin.y+94, 255, 200)];
    _messageTextView.layer.borderWidth = 1.0;
    _messageTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _messageTextView.layer.cornerRadius = 10.0;
    _messageTextView.clipsToBounds = YES;
    _messageTextView.backgroundColor = [UIColor whiteColor];
    _messageTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _messageTextView.text = @"Enter Message ...";
    _messageTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_messageTextView];
    
    [self setTextFieldDelegates];
}

-(void)layoutForIphone6PlusWithContentSize:(CGSize)contentSize
{
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(55, 20, 338, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(62, 212, 294, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    _firstNameField.text = _prospect[FirstName];
    [_scrollView addSubview:_firstNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(62, _firstNameField.frame.origin.y+94, 294, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    _emailField.text = _prospect[Email];
    [_scrollView addSubview:_emailField];
    
    _subjectField = [[UITextField alloc]initWithFrame:CGRectMake(62, _emailField.frame.origin.y+94, 294, 30)];
    _subjectField.placeholder = @"Subject";
    _subjectField.textAlignment = NSTextAlignmentCenter;
    _subjectField.layer.borderWidth = 1.0;
    _subjectField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _subjectField.layer.cornerRadius = 10.0;
    _subjectField.clipsToBounds = YES;
    _subjectField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_subjectField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(63, _subjectField.frame.origin.y+94, 294, 200)];
    _messageTextView.layer.borderWidth = 1.0;
    _messageTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _messageTextView.layer.cornerRadius = 10.0;
    _messageTextView.clipsToBounds = YES;
    _messageTextView.backgroundColor = [UIColor whiteColor];
    _messageTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _messageTextView.text = @"Enter Message ...";
    _messageTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
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

-(void)textViewDidBeginEditing:(UITextView *)textView
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
