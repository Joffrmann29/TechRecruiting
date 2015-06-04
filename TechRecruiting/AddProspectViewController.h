//
//  AddProspectViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/29/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Prospect.h"
#import "AppDelegate.h"

@interface AddProspectViewController : UIViewController<UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate>

- (IBAction)cancelAdd:(id)sender;
- (IBAction)addProspectToParse:(id)sender;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *phoneField;
@property (strong, nonatomic) UITextField *secondaryPhoneField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;

@end
