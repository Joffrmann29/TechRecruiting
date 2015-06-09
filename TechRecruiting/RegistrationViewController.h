//
//  RegistrationViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
//#import "MBProgressHUD.h"
#import "AppDelegate.h"

@interface RegistrationViewController : UIViewController<UITextFieldDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UITextField *userField;
@property (strong, nonatomic) UITextField *passField;
@property (strong, nonatomic) UITextField *confirmPasswordField;
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;

- (IBAction)registerUser:(id)sender;
- (IBAction)backToLogin:(id)sender;
@end
