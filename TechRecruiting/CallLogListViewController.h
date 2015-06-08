//
//  CallLogListViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "CallLogDetailViewController.h"

@interface CallLogListViewController : UITableViewController

@property (strong,nonatomic) NSMutableArray *callLogArray;

@property (strong, nonatomic) PFObject *prospect;

@property (nonatomic) BOOL prospectMode;

@end
