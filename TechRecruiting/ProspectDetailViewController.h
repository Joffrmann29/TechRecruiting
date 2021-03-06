//
//  ProspectDetailViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Defines.h"
#import<CoreTelephony/CTCallCenter.h>
#import<CoreTelephony/CTCall.h>
#import<CoreTelephony/CTCarrier.h>
#import<CoreTelephony/CTTelephonyNetworkInfo.h>
#import <MessageUI/MessageUI.h>
#import "AddMessageViewController.h"
#import "AddCallViewController.h"
#import "MessagesListViewController.h"
#import "EditProspectViewController.h"
#import "MBProgressHUD.h"
#import "CallLogListViewController.h"

@interface ProspectDetailViewController : UIViewController<UIScrollViewDelegate, MFMailComposeViewControllerDelegate, AddMessageDelegate>

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UILabel *firstNameLabel;
@property (strong, nonatomic) UILabel *lastNameLabel;
@property (strong, nonatomic) UILabel *phoneLabel;
@property (strong, nonatomic) UILabel *secondaryPhoneLabel;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UITextView *prospectTextView;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIButton *callButton;
@property (strong, nonatomic) UIButton *secondaryCallButton;
@property (strong, nonatomic) UIButton *emailButton;
@property (strong, nonatomic) UIButton *viewCallsButton;
@property (strong, nonatomic) UIButton *editButton;
@property (strong,nonatomic) CTCall *prospectCall;
@property (strong, nonatomic) CTCallCenter *callCenter;
@property (strong, nonatomic) PFObject *prospect;

-(void)callProspect:(UIButton *)sender;

@end
