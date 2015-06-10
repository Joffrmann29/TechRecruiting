//
//  ViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *userField;
@property (strong, nonatomic) UITextField *passField;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;

-(void)loginToTechRecruiting:(id)sender;

-(void)goToRegistration:(id)sender;

@end

