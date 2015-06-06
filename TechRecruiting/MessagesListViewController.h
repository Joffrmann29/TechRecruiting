//
//  MessagesListViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MessageDetailViewController.h"

@interface MessagesListViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *messages;

@end
