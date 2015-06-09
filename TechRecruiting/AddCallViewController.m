//
//  AddCallViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/6/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AddCallViewController.h"

@interface AddCallViewController ()

@property (strong, nonatomic) MBProgressHUD *myHud;

@end

@implementation AddCallViewController

//MBProgressHUD *hud;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        //call layout method for Iphone 6 Plus
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.2);
        [self layoutForIphone6PlusWithContentSize:_scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.5);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        [self layoutForIPhone4S];
    }
}

-(void)loadingOverlay
{
    _myHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _myHud.labelText = @"Loading";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.7);
    [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
}

-(void)layoutForIphone5WithContentSize:(CGSize)size
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _natureOfCallField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 255, 30)];
    _natureOfCallField.placeholder = @"Nature of Call";
    _natureOfCallField.textAlignment = NSTextAlignmentCenter;
    _natureOfCallField.layer.borderWidth = 1.0;
    _natureOfCallField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _natureOfCallField.layer.cornerRadius = 10.0;
    _natureOfCallField.clipsToBounds = YES;
    _natureOfCallField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_natureOfCallField];
    
    _durationField = [[UITextField alloc]initWithFrame:CGRectMake(60, _natureOfCallField.frame.origin.y+94, 255, 30)];
    _durationField.placeholder = @"Duration";
    _durationField.textAlignment = NSTextAlignmentCenter;
    _durationField.layer.borderWidth = 1.0;
    _durationField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _durationField.layer.cornerRadius = 10.0;
    _durationField.clipsToBounds = YES;
    _durationField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_durationField];
    
    _resultField = [[UITextField alloc]initWithFrame:CGRectMake(60, _durationField.frame.origin.y+94, 255, 30)];
    _resultField.placeholder = @"Result";
    _resultField.textAlignment = NSTextAlignmentCenter;
    _resultField.layer.borderWidth = 1.0;
    _resultField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _resultField.layer.cornerRadius = 10.0;
    _resultField.clipsToBounds = YES;
    _resultField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_resultField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _resultField.frame.origin.y+94, 255, 200)];
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
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.3);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _natureOfCallField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 255, 30)];
    _natureOfCallField.placeholder = @"Nature of Call";
    _natureOfCallField.textAlignment = NSTextAlignmentCenter;
    _natureOfCallField.layer.borderWidth = 1.0;
    _natureOfCallField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _natureOfCallField.layer.cornerRadius = 10.0;
    _natureOfCallField.clipsToBounds = YES;
    _natureOfCallField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_natureOfCallField];
    
    _durationField = [[UITextField alloc]initWithFrame:CGRectMake(60, _natureOfCallField.frame.origin.y+94, 255, 30)];
    _durationField.placeholder = @"Duration";
    _durationField.textAlignment = NSTextAlignmentCenter;
    _durationField.layer.borderWidth = 1.0;
    _durationField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _durationField.layer.cornerRadius = 10.0;
    _durationField.clipsToBounds = YES;
    _durationField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_durationField];
    
    _resultField = [[UITextField alloc]initWithFrame:CGRectMake(60, _durationField.frame.origin.y+94, 255, 30)];
    _resultField.placeholder = @"Result";
    _resultField.textAlignment = NSTextAlignmentCenter;
    _resultField.layer.borderWidth = 1.0;
    _resultField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _resultField.layer.cornerRadius = 10.0;
    _resultField.clipsToBounds = YES;
    _resultField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_resultField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _resultField.frame.origin.y+94, 255, 200)];
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
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1300)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _natureOfCallField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 294, 30)];
    _natureOfCallField.placeholder = @"Nature of Call";
    _natureOfCallField.textAlignment = NSTextAlignmentCenter;
    _natureOfCallField.layer.borderWidth = 1.0;
    _natureOfCallField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _natureOfCallField.layer.cornerRadius = 10.0;
    _natureOfCallField.clipsToBounds = YES;
    _natureOfCallField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_natureOfCallField];
    
    _durationField = [[UITextField alloc]initWithFrame:CGRectMake(60, _natureOfCallField.frame.origin.y+94, 294, 30)];
    _durationField.placeholder = @"Duration";
    _durationField.textAlignment = NSTextAlignmentCenter;
    _durationField.layer.borderWidth = 1.0;
    _durationField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _durationField.layer.cornerRadius = 10.0;
    _durationField.clipsToBounds = YES;
    _durationField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_durationField];
    
    _resultField = [[UITextField alloc]initWithFrame:CGRectMake(60, _durationField.frame.origin.y+94, 294, 30)];
    _resultField.placeholder = @"Result";
    _resultField.textAlignment = NSTextAlignmentCenter;
    _resultField.layer.borderWidth = 1.0;
    _resultField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _resultField.layer.cornerRadius = 10.0;
    _resultField.clipsToBounds = YES;
    _resultField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_resultField];
    
    _messageTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _resultField.frame.origin.y+94, 294, 200)];
    _messageTextView.layer.borderWidth = 1.0;
    _messageTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _messageTextView.layer.cornerRadius = 10.0;
    _messageTextView.clipsToBounds = YES;
    _messageTextView.backgroundColor = [UIColor whiteColor];
    _messageTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _messageTextView.text = @"Enter Notes ...";
    _messageTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_messageTextView];
    
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveButton.frame = CGRectMake(55, 800, 145, 60);
    _saveButton.layer.cornerRadius = 10;
    [_saveButton setClipsToBounds:YES];
    [_saveButton setTitle:@"Save" forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(saveCall:) forControlEvents:UIControlEventTouchUpInside];
    [_saveButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_saveButton];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(214, 800, 145, 60);
    _cancelButton.layer.cornerRadius = 10;
    [_cancelButton setClipsToBounds:YES];
    [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_scrollView addSubview:_cancelButton];
    
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
    _natureOfCallField.delegate = self;
    _resultField.delegate = self;
    _durationField.delegate = self;
    _messageTextView.delegate = self;
}

-(void)saveCallObject
{
    PFObject *callObject = [PFObject objectWithClassName:@"Calls"];
    
    callObject[@"NatureOfCall"] = _natureOfCallField.text;
    callObject[@"Duration"] = _durationField.text;
    callObject[@"Result"] = _resultField.text;
    callObject[@"Notes"] = _messageTextView.text;
    callObject[@"FirstName"] = _prospect[@"FirstName"];
    callObject[@"LastName"] = _prospect[@"LastName"];
    callObject[@"PhoneNumber"] = _phone;
    callObject[@"DateCalled"] = [NSDate date];
    
    PFRelation *propsectRelation = [callObject relationForKey:@"ProspectForCall"];
    [propsectRelation addObject:_prospect];
    
    PFRelation *userRelation = [callObject relationForKey:@"User"];
    [userRelation addObject:[PFUser currentUser]];
    
    [callObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Call Saved" message:@"The call has been successfuly saved to your call list." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            [_myHud hide:YES];
        }
        
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed to Save Call" message:@"The call was not saved to your call list. Please try again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
            [_myHud hide:YES];
        }
    }];
}

- (void)saveCall:(id)sender
{
    [self saveCallObject];
    [self loadingOverlay];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
