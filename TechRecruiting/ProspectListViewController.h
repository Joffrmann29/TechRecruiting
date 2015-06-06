//
//  ProspectListViewController.h
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Defines.h"
#import "ProspectDetailViewController.h"

@interface ProspectListViewController : UITableViewController<UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableArray *prospects;

- (IBAction)viewOptions:(id)sender;

@end
