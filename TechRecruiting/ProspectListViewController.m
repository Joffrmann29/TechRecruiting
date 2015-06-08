//
//  ProspectListViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ProspectListViewController.h"

@interface ProspectListViewController ()

@end

@implementation ProspectListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self performProspectQuery];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self performProspectQuery];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.hidesBackButton = YES;
}

-(void)performProspectQuery
{
    PFQuery *prospectQuery = [PFQuery queryWithClassName:@"Prospects"];
    [prospectQuery whereKey:@"User" equalTo:[PFUser currentUser]];
    [prospectQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            _prospects = [objects mutableCopy];
            [self.tableView reloadData];
            NSLog(@"%@", _prospects);
        }
        else {
            NSLog(@"%@", error);
            NSString *errorString = [NSString stringWithFormat:@"%@", error];
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_prospects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProspectCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    PFObject *prospectObject = [_prospects objectAtIndex:indexPath.row];
    
    cell.textLabel.text = prospectObject[@"FirstName"];
    cell.detailTextLabel.text = prospectObject[@"LastName"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    PFObject *prospect = _prospects[indexPath.row];
    PFACL *groupACL = [PFACL ACL];
    [groupACL setPublicWriteAccess:YES];
    prospect.ACL = groupACL;
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [prospect deleteInBackground];
        [self.prospects removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toProspectDetail" sender:indexPath];
}

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

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        [self performSegueWithIdentifier:@"toAddProspect" sender:self];
    }
    
    else if(buttonIndex == 1)
    {
        [self performSegueWithIdentifier:@"toCallLog" sender:self];
    }
    
    else if(buttonIndex == 2)
    {
        [self performSegueWithIdentifier:@"toMessageLog" sender:self];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"toProspectDetail"])
    {
        NSIndexPath *path = sender;
        PFObject *prospect = _prospects[path.row];
        ProspectDetailViewController *pdvc = (ProspectDetailViewController *)segue.destinationViewController;
        pdvc.prospect = prospect;
    }
}


- (IBAction)viewOptions:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Options" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Add Prospect" otherButtonTitles:@"Call Log", @"E-mail Log", nil];
    [actionSheet showInView:self.view];
}
@end
