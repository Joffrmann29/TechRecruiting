//
//  ViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
//MBProgressHUD *hud;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        //call layout method for Iphone 6 Plus
        [self layoutViewsForIPhone6Plus];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutViewsForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5];
    }
    
    else
    {
        [self layoutForIphone4];
        
    }
}

//-(void)loadingOverlay
//{
//    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.labelText = @"Loading";
//}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)layoutForIphone4
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [self.view addSubview:_imgView];
    
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
    [self.view addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 200, 30)];
    _passField.placeholder = @"Password";
    [_passField setSecureTextEntry:YES];
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_passField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(55, 378, 95, 60);
    _loginButton.layer.cornerRadius = 10;
    [_loginButton setClipsToBounds:YES];
    [_loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginToTechRecruiting:) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(170, 378, 95, 60);
    _registerButton.layer.cornerRadius = 10;
    [_registerButton setClipsToBounds:YES];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(goToRegistration:) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_registerButton];
    
    [self setTextFieldDelegates];
    //[self loadingOverlay];
}

-(void)layoutForIphone5
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [self.view addSubview:_imgView];
    
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
    [self.view addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 200, 30)];
    _passField.placeholder = @"Password";
    [_passField setSecureTextEntry:YES];
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_passField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(55, 400, 95, 60);
    _loginButton.layer.cornerRadius = 10;
    [_loginButton setClipsToBounds:YES];
    [_loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginToTechRecruiting:) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(170, 400, 95, 60);
    _registerButton.layer.cornerRadius = 10;
    [_registerButton setClipsToBounds:YES];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(goToRegistration:) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_registerButton];
    
    [self setTextFieldDelegates];
    //[self loadingOverlay];
}

-(void)layoutViewsForIPhone6
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [self.view addSubview:_imgView];
    
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
    [self.view addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 255, 30)];
    _passField.placeholder = @"Password";
    [_passField setSecureTextEntry:YES];
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_passField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(55, 400, 120, 60);
    _loginButton.layer.cornerRadius = 10;
    [_loginButton setClipsToBounds:YES];
    [_loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginToTechRecruiting:) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(200, 400, 120, 60);
    _registerButton.layer.cornerRadius = 10;
    [_registerButton setClipsToBounds:YES];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(goToRegistration:) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_registerButton];
    
    [self setTextFieldDelegates];
    //[self loadingOverlay];
}

-(void)layoutViewsForIPhone6Plus
{    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [self.view addSubview:_imgView];
    
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
    [self.view addSubview:_userField];
    
    _passField = [[UITextField alloc]initWithFrame:CGRectMake(60, _userField.frame.origin.y+94, 294, 30)];
    _passField.placeholder = @"Password";
    [_passField setSecureTextEntry:YES];
    _passField.textAlignment = NSTextAlignmentCenter;
    _passField.layer.borderWidth = 1.0;
    _passField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _passField.layer.cornerRadius = 10.0;
    _passField.clipsToBounds = YES;
    _passField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_passField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(55, 400, 145, 60);
    _loginButton.layer.cornerRadius = 10;
    [_loginButton setClipsToBounds:YES];
    [_loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(loginToTechRecruiting:) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(214, 400, 145, 60);
    _registerButton.layer.cornerRadius = 10;
    [_registerButton setClipsToBounds:YES];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(goToRegistration:) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [self.view addSubview:_registerButton];
    
    [self setTextFieldDelegates];
    //[self loadingOverlay];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

-(void)setTextFieldDelegates
{
    _userField.delegate = self;
    _passField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginToTechRecruiting:(id)sender {
    [PFUser logInWithUsernameInBackground:self.userField.text password:self.passField.text block:^(PFUser *user, NSError *error) {
        if (user)
        {
            //Open the wall
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Success" message:@"You have successfully logged in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [self performSegueWithIdentifier:@"toProspectList" sender:self];
            _userField.text = nil;
            _passField.text = nil;
            //[hud hide:YES];
        }
        else
        {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
            //[hud hide:YES];
        }
    }];
}

-(void)goToRegistration:(id)sender
{
    [self performSegueWithIdentifier:@"toRegister" sender:self];
}

@end
