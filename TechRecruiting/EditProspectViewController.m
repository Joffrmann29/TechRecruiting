//
//  EditProspectViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 6/8/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "EditProspectViewController.h"

@interface EditProspectViewController ()

@end

@implementation EditProspectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.65);
        //call layout method for Iphone 6 Plus
        [self layoutForIphone6PlusWithContentSize:self.scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.8);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        [self layoutForIPhone4S];
    }
        
    _firstNameField.text = _prospect[FirstName];
    _lastNameField.text = _prospect[LastName];
    _phoneField.text = _prospect[Phone];
    _secondaryPhoneField.text = _prospect[SecondaryPhone];
    _emailField.text = _prospect[Email];
    _textView.text = _prospect[Notes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

/* UITextView Delegate method. This method is triggered when the user types a new character in the textView. */
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    /* Test if the entered text is a return. If it is we tell textView to dismiss the keyboard and then we stop the textView from entering in additional information as text. This is not a perfect solution because users cannot enter returns in their text and if they paste text with a return items after the return will not be added. For the functionality required in this project this solution works just fine. */
    if ([text isEqualToString:@"\n"]){
        [self.textView resignFirstResponder];
        return NO;
    }
    else return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    _textView.text = nil;
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*2.2);
    [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
}

-(void)layoutForIphone5WithContentSize:(CGSize)contentSize
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 240, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 200, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 200, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _phoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 200, 30)];
    _phoneField.placeholder = @"Phone";
    _phoneField.textAlignment = NSTextAlignmentCenter;
    _phoneField.layer.borderWidth = 1.0;
    _phoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _phoneField.layer.cornerRadius = 10.0;
    _phoneField.clipsToBounds = YES;
    _phoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_phoneField];
    
    _secondaryPhoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _phoneField.frame.origin.y+94, 200, 30)];
    _secondaryPhoneField.placeholder = @"Secondary Phone";
    _secondaryPhoneField.textAlignment = NSTextAlignmentCenter;
    _secondaryPhoneField.layer.borderWidth = 1.0;
    _secondaryPhoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _secondaryPhoneField.layer.cornerRadius = 10.0;
    _secondaryPhoneField.clipsToBounds = YES;
    _secondaryPhoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_secondaryPhoneField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _secondaryPhoneField.frame.origin.y+94, 200, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailField.frame.origin.y+94, 200, 200)];
    _textView.text = @"Enter notes ...";
    _textView.layer.borderWidth = 1.0;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.cornerRadius = 10.0;
    _textView.clipsToBounds = YES;
    _textView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_textView];
    
    [self setTextFieldDelegates];
}

-(void)layoutForIPhone6
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.5);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 255, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 255, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _phoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 255, 30)];
    _phoneField.placeholder = @"Phone";
    _phoneField.textAlignment = NSTextAlignmentCenter;
    _phoneField.layer.borderWidth = 1.0;
    _phoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _phoneField.layer.cornerRadius = 10.0;
    _phoneField.clipsToBounds = YES;
    _phoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_phoneField];
    
    _secondaryPhoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _phoneField.frame.origin.y+94, 255, 30)];
    _secondaryPhoneField.placeholder = @"Secondary Phone";
    _secondaryPhoneField.textAlignment = NSTextAlignmentCenter;
    _secondaryPhoneField.layer.borderWidth = 1.0;
    _secondaryPhoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _secondaryPhoneField.layer.cornerRadius = 10.0;
    _secondaryPhoneField.clipsToBounds = YES;
    _secondaryPhoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_secondaryPhoneField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _secondaryPhoneField.frame.origin.y+94, 255, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailField.frame.origin.y+94, 255, 200)];
    _textView.text = @"Enter notes ...";
    _textView.layer.borderWidth = 1.0;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.cornerRadius = 10.0;
    _textView.clipsToBounds = YES;
    _textView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_textView];
    
    [self setTextFieldDelegates];
}


-(void)layoutForIphone6PlusWithContentSize:(CGSize)contentSize
{
    //self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.6);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, 212, 294, 30)];
    _firstNameField.placeholder = @"First Name";
    _firstNameField.textAlignment = NSTextAlignmentCenter;
    _firstNameField.layer.borderWidth = 1.0;
    _firstNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _firstNameField.layer.cornerRadius = 10.0;
    _firstNameField.clipsToBounds = YES;
    _firstNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_firstNameField];
    
    _lastNameField = [[UITextField alloc]initWithFrame:CGRectMake(60, _firstNameField.frame.origin.y+94, 294, 30)];
    _lastNameField.placeholder = @"Last Name";
    _lastNameField.textAlignment = NSTextAlignmentCenter;
    _lastNameField.layer.borderWidth = 1.0;
    _lastNameField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _lastNameField.layer.cornerRadius = 10.0;
    _lastNameField.clipsToBounds = YES;
    _lastNameField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_lastNameField];
    
    _phoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _lastNameField.frame.origin.y+94, 294, 30)];
    _phoneField.placeholder = @"Phone";
    _phoneField.textAlignment = NSTextAlignmentCenter;
    _phoneField.layer.borderWidth = 1.0;
    _phoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _phoneField.layer.cornerRadius = 10.0;
    _phoneField.clipsToBounds = YES;
    _phoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_phoneField];
    
    _secondaryPhoneField = [[UITextField alloc]initWithFrame:CGRectMake(60, _phoneField.frame.origin.y+94, 294, 30)];
    _secondaryPhoneField.placeholder = @"Secondary Phone";
    _secondaryPhoneField.textAlignment = NSTextAlignmentCenter;
    _secondaryPhoneField.layer.borderWidth = 1.0;
    _secondaryPhoneField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _secondaryPhoneField.layer.cornerRadius = 10.0;
    _secondaryPhoneField.clipsToBounds = YES;
    _secondaryPhoneField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_secondaryPhoneField];
    
    _emailField = [[UITextField alloc]initWithFrame:CGRectMake(60, _secondaryPhoneField.frame.origin.y+94, 294, 30)];
    _emailField.placeholder = @"E-mail";
    _emailField.textAlignment = NSTextAlignmentCenter;
    _emailField.layer.borderWidth = 1.0;
    _emailField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _emailField.layer.cornerRadius = 10.0;
    _emailField.clipsToBounds = YES;
    _emailField.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_emailField];
    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailField.frame.origin.y+94, 294, 200)];
    _textView.text = @"Enter notes ...";
    _textView.layer.borderWidth = 1.0;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.cornerRadius = 10.0;
    _textView.clipsToBounds = YES;
    _textView.backgroundColor = [UIColor whiteColor];
    [_scrollView addSubview:_textView];
    
    [self setTextFieldDelegates];
}

-(void)setTextFieldDelegates
{
    _firstNameField.delegate = self;
    _lastNameField.delegate = self;
    _phoneField.delegate = self;
    _secondaryPhoneField.delegate = self;
    _emailField.delegate = self;
    _textView.delegate = self;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)saveProspectObject
{
    [_prospect setObject:_firstNameField.text forKey:FirstName];
    [_prospect setObject:_lastNameField.text forKey:LastName];
    [_prospect setObject:_phoneField.text forKey:Phone];
    [_prospect setObject:_secondaryPhoneField.text forKey:SecondaryPhone];
    [_prospect setObject:_emailField.text forKey:Email];
    [_prospect setObject:_textView.text forKey:Notes];
    PFRelation *relation = [_prospect relationForKey:USERSPROSPECTSUSER];
    [relation addObject:[PFUser currentUser]];
    [_prospect saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Prospect Edited" message:@"The prospect has been successfuly edited in your recruting list." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
        
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed to Add Prospect" message:@"The prospect was not successfully edited in your recruiting list. Please try again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
    }];
}

- (IBAction)saveProspectToParse:(id)sender
{
    [self saveProspectObject];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelSave:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
