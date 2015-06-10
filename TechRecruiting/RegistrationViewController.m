//
//  RegistrationViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@property (strong, nonatomic) MBProgressHUD *myHud;

@end

@implementation RegistrationViewController
//MBProgressHUD *hud;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.2);
        //call layout method for Iphone 6 Plus
        [self layoutForIphone6PlusWithContentSize:self.scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIphone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
        [self layoutForIphone4S];
    }
}

-(void)loadingOverlay
{
    _myHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _myHud.labelText = @"Loading";
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)setTextFieldDelegates
{
    _userField.delegate = self;
    _passField.delegate = self;
    _firstNameField.delegate = self;
    _lastNameField.delegate = self;
    _emailField.delegate = self;
    _confirmPasswordField.delegate = self;
}

-(void)layoutForIphone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
    [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
}

-(void)layoutForIphone5WithContentSize:(CGSize)contentSize
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _userField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 200, 30)];
    _userField.placeholder = @"Username";
    _userField.textAlignment = NSTextAlignmentCenter;
    _userField.layer.borderWidth = 1.0;
    _userField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _userField.layer.cornerRadius = 10.0;
    _userField.clipsToBounds = YES;
    _userField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 200, 30)];
    _passField.placeholder = @"Password";
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_passField];
    
    _confirmPasswordField = [[UITextField alloc]initWithFrame:CGRectMake(60, _passField.frame.origin.y+94, 200, 30)];
    _confirmPasswordField.placeholder = @"Confirm Password";
    _confirmPasswordField.textAlignment = NSTextAlignmentCenter;
    _confirmPasswordField.layer.borderWidth = 1.0;
    _confirmPasswordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _confirmPasswordField.layer.cornerRadius = 10.0;
    _confirmPasswordField.clipsToBounds = YES;
    _confirmPasswordField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_confirmPasswordField];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _confirmPasswordField.frame.origin.y+94, 200, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 200, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 200, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    [self setTextFieldDelegates];
    
    //[self loadingOverlay];
}

-(void)layoutForIphone6
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.4);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _userField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 255, 30)];
    _userField.placeholder = @"Username";
    _userField.textAlignment = NSTextAlignmentCenter;
    _userField.layer.borderWidth = 1.0;
    _userField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _userField.layer.cornerRadius = 10.0;
    _userField.clipsToBounds = YES;
    _userField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 255, 30)];
    _passField.placeholder = @"Password";
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_passField];
    
    _confirmPasswordField = [[UITextField alloc]initWithFrame:CGRectMake(60, _passField.frame.origin.y+94, 255, 30)];
    _confirmPasswordField.placeholder = @"Confirm Password";
    _confirmPasswordField.textAlignment = NSTextAlignmentCenter;
    _confirmPasswordField.layer.borderWidth = 1.0;
    _confirmPasswordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _confirmPasswordField.layer.cornerRadius = 10.0;
    _confirmPasswordField.clipsToBounds = YES;
    _confirmPasswordField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_confirmPasswordField];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _confirmPasswordField.frame.origin.y+94, 255, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 255, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 255, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    [self setTextFieldDelegates];
    
    //[self loadingOverlay];
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
    
    _userField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 294, 30)];
    _userField.placeholder = @"Username";
    _userField.textAlignment = NSTextAlignmentCenter;
    _userField.layer.borderWidth = 1.0;
    _userField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _userField.layer.cornerRadius = 10.0;
    _userField.clipsToBounds = YES;
    _userField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 294, 30)];
    _passField.placeholder = @"Password";
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_passField];
    
    _confirmPasswordField = [[UITextField alloc]initWithFrame:CGRectMake(60, _passField.frame.origin.y+94, 294, 30)];
    _confirmPasswordField.placeholder = @"Confirm Password";
    _confirmPasswordField.textAlignment = NSTextAlignmentCenter;
    _confirmPasswordField.layer.borderWidth = 1.0;
    _confirmPasswordField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _confirmPasswordField.layer.cornerRadius = 10.0;
    _confirmPasswordField.clipsToBounds = YES;
    _confirmPasswordField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_confirmPasswordField];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _confirmPasswordField.frame.origin.y+94, 294, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 294, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 294, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    
    [self setTextFieldDelegates];
    
    //[self loadingOverlay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didAddUser
{
    PFUser *newUser = [PFUser user];
    newUser.username = self.userField.text;
    newUser.password = self.passField.text;
    newUser[@"FirstName"] = self.firstNameField.text;
    newUser[@"LastName"] = self.lastNameField.text;
    newUser[@"email"] = self.emailField.text;
    newUser[@"ConfirmPassword"] = self.confirmPasswordField.text;

    [self loadingOverlay];
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            [self dismissViewControllerAnimated:YES completion:^{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"Your recruiter account has been successfully created" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
                [_myHud hide:YES];
            }];
        }
        else{
            NSLog(@"%@", error);
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
            [_myHud hide:YES];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registerUser:(id)sender {
    [self didAddUser];
}

- (IBAction)backToLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
