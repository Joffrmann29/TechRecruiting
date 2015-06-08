//
//  MessageDetailViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface MessageDetailViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) UILabel *recipientLabel;
@property (strong, nonatomic) UILabel *subjectLabel;
@property (strong, nonatomic) UILabel *bodyLabel;
@property (strong, nonatomic) UILabel *addressLabel;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) PFObject *message;

@end
