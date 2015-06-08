//
//  EditProspectViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/8/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Defines.h"
#import "Prospect.h"
#import "AppDelegate.h"

@interface EditProspectViewController : UIViewController<UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate>

- (IBAction)cancelSave:(id)sender;
- (IBAction)saveProspectToParse:(id)sender;

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *lastNameField;
@property (strong, nonatomic) UITextField *phoneField;
@property (strong, nonatomic) UITextField *secondaryPhoneField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;

@property (strong, nonatomic) PFObject *prospect;

@end
