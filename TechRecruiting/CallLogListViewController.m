//
//  CallLogListViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "CallLogListViewController.h"

@interface CallLogListViewController ()

@property (strong, nonatomic) MBProgressHUD *myHud;

@end

@implementation CallLogListViewController
//MBProgressHUD *hud;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self performProspectQuery];
    [self loadingOverlay];
}

-(void)loadingOverlay
{
    _myHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _myHud.labelText = @"Loading";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)performProspectQuery
{
    PFQuery *prospectQuery = [PFQuery queryWithClassName:@"Calls"];
    [prospectQuery whereKey:@"User" equalTo:[PFUser currentUser]];
    if(_prospectMode == YES)
    {
        [prospectQuery whereKey:@"ProspectForCall" equalTo:_prospect];
    }
    [prospectQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            _callLogArray = [objects mutableCopy];
            [self.tableView reloadData];
            NSLog(@"Phone Number****%@", _callLogArray);
            [_myHud hide:YES];
        }
        else {
            NSLog(@"%@", error);
            NSString *errorString = [NSString stringWithFormat:@"%@", error];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
            [_myHud hide:YES];
        }
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_callLogArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    PFObject *callsObject = [_callLogArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", callsObject[@"FirstName"], callsObject[@"LastName"]];
    cell.detailTextLabel.text = callsObject[@"PhoneNumber"];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toCallDetail" sender:indexPath];
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     NSIndexPath *indexPath = sender;
     PFObject *callObject = _callLogArray[indexPath.row];
     CallLogDetailViewController *cldvc = (CallLogDetailViewController *)segue.destinationViewController;
     cldvc.call = callObject;
 }


@end
