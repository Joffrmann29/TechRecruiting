//
//  AddMessageViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/4/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "Defines.h"

@protocol AddMessageDelegate <NSObject>

-(void)sendMessageWithFields:(NSString *)firstName andEmail:(NSString *)email andSubject:(NSString *)subject andBody:(NSString *)body withSender:(UIButton *)sender;

@end

@interface AddMessageViewController : UIViewController<UITextFieldDelegate, UITextViewDelegate, UIScrollViewDelegate>

- (IBAction)cancelSend:(id)sender;
- (IBAction)sendEmailToProspect:(id)sender;

@property (strong, nonatomic) UITextField *firstNameField;
@property (strong, nonatomic) UITextField *emailField;
@property (strong, nonatomic) UITextField *subjectField;
@property (strong, nonatomic) UITextView *messageTextView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) PFObject *prospect;

@property (weak, nonatomic) id <AddMessageDelegate> delegate;

@end
