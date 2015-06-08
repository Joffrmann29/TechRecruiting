//
//  AddCallViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/6/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface AddCallViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIScrollViewDelegate>

- (IBAction)cancelSend:(id)sender;
- (IBAction)saveCall:(id)sender;

@property (strong, nonatomic) UITextField *natureOfCallField;
@property (strong, nonatomic) UITextField *durationField;
@property (strong, nonatomic) UITextField *resultField;
@property (strong, nonatomic) UITextView *messageTextView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) PFObject *prospect;

@end
