//
//  CallLogDetailViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface CallLogDetailViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) UILabel *natureLabel;
@property (strong, nonatomic) UILabel *durationLabel;
@property (strong, nonatomic) UILabel *resultLabel;
@property (strong, nonatomic) UITextView *notesTextView;
@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UIImageView *logoView;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) PFObject *call;

@end
