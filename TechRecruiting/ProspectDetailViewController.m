//
//  ProspectDetailViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "ProspectDetailViewController.h"

@interface ProspectDetailViewController ()

@property (strong, nonatomic) NSString *recipient;
@property (strong, nonatomic) NSString *subject;
@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *email;

@end

@implementation ProspectDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_scrollView];
    self.scrollView.delegate = self;
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSLog(@"%@", [appDelegate platformString]);
    if([[appDelegate platformString]isEqualToString:@"iPhone 6 Plus"]){
        //call layout method for Iphone 6 Plus
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.4);
        [self layoutForIphone6PlusWithContentSize:_scrollView.contentSize];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.5);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        [self layoutForIPhone4S];
    }
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.7);
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
    
    _firstNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 255, 46)];
    _firstNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _firstNameLabel.text = [NSString stringWithFormat:@"First Name:         %@", _prospect[FirstName]];
    _firstNameLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_firstNameLabel];
    
    _lastNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _firstNameLabel.frame.origin.y+94, 255, 46)];
    _lastNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _lastNameLabel.text = [NSString stringWithFormat:@"Last Name:         %@", _prospect[LastName]];;
    [_scrollView addSubview:_lastNameLabel];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _lastNameLabel.frame.origin.y+94, 255, 46)];
    _phoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _phoneLabel.text = [NSString stringWithFormat:@"Phone:         %@", _prospect[Phone]];
    [_scrollView addSubview:_phoneLabel];
    
    _secondaryPhoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _phoneLabel.frame.origin.y+94, 255, 46)];
    _secondaryPhoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _secondaryPhoneLabel.text = [NSString stringWithFormat:@"Secondary Phone:    %@", _prospect[SecondaryPhone]];
    [_scrollView addSubview:_secondaryPhoneLabel];
    
    _emailLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _secondaryPhoneLabel.frame.origin.y+94, 255, 46)];
    _emailLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _emailLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _prospect[Email]];
    [_scrollView addSubview:_emailLabel];
    
    _prospectTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailLabel.frame.origin.y+94, 255, 200)];
    _prospectTextView.layer.borderWidth = 1.0;
    _prospectTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _prospectTextView.layer.cornerRadius = 10.0;
    _prospectTextView.clipsToBounds = YES;
    _prospectTextView.backgroundColor = [UIColor whiteColor];
    _prospectTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _prospectTextView.text = _prospect[Notes];
    _prospectTextView.editable = NO;
    [_scrollView addSubview:_prospectTextView];
    
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _callButton.frame = CGRectMake(294, _phoneLabel.frame.origin.y, 48, 48);
    _callButton.tag = 0;
    _callButton.layer.cornerRadius = 10;
    [_callButton setClipsToBounds:YES];
    [_callButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_callButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_callButton];
    
    _secondaryCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondaryCallButton.frame = CGRectMake(354, _secondaryPhoneLabel.frame.origin.y, 48, 48);
    _secondaryCallButton.tag = 1;
    _secondaryCallButton.layer.cornerRadius = 10;
    [_secondaryCallButton setClipsToBounds:YES];
    [_secondaryCallButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_secondaryCallButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_secondaryCallButton];
    
    _emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _emailButton.frame = CGRectMake(_prospectTextView.frame.origin.x, 900, 100, 48);
    _emailButton.layer.cornerRadius = 10;
    [_emailButton setClipsToBounds:YES];
    [_emailButton addTarget:self action:@selector(viewEmails:) forControlEvents:UIControlEventTouchUpInside];
    [_emailButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_emailButton setTitle:@"E-mails" forState:UIControlStateNormal];
    [_scrollView addSubview:_emailButton];
    
    _viewCallsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _viewCallsButton.frame = CGRectMake(254, 900, 100, 48);
    _viewCallsButton.layer.cornerRadius = 10;
    [_viewCallsButton setClipsToBounds:YES];
    [_viewCallsButton addTarget:self action:@selector(viewCalls:) forControlEvents:UIControlEventTouchUpInside];
    [_viewCallsButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_viewCallsButton setTitle:@"Calls" forState:UIControlStateNormal];
    [_scrollView addSubview:_viewCallsButton];
}

-(void)layoutForIPhone6
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.3);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 255, 46)];
    _firstNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _firstNameLabel.text = [NSString stringWithFormat:@"First Name:         %@", _prospect[FirstName]];
    _firstNameLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_firstNameLabel];
    
    _lastNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _firstNameLabel.frame.origin.y+94, 255, 46)];
    _lastNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _lastNameLabel.text = [NSString stringWithFormat:@"Last Name:         %@", _prospect[LastName]];;
    [_scrollView addSubview:_lastNameLabel];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _lastNameLabel.frame.origin.y+94, 255, 46)];
    _phoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _phoneLabel.text = [NSString stringWithFormat:@"Phone:         %@", _prospect[Phone]];
    [_scrollView addSubview:_phoneLabel];
    
    _secondaryPhoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _phoneLabel.frame.origin.y+94, 255, 46)];
    _secondaryPhoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _secondaryPhoneLabel.text = [NSString stringWithFormat:@"Secondary Phone:    %@", _prospect[SecondaryPhone]];
    [_scrollView addSubview:_secondaryPhoneLabel];
    
    _emailLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _secondaryPhoneLabel.frame.origin.y+94, 255, 46)];
    _emailLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _emailLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _prospect[Email]];
    [_scrollView addSubview:_emailLabel];
    
    _prospectTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailLabel.frame.origin.y+94, 255, 200)];
    _prospectTextView.layer.borderWidth = 1.0;
    _prospectTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _prospectTextView.layer.cornerRadius = 10.0;
    _prospectTextView.clipsToBounds = YES;
    _prospectTextView.backgroundColor = [UIColor whiteColor];
    _prospectTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _prospectTextView.text = _prospect[Notes];
    _prospectTextView.editable = NO;
    [_scrollView addSubview:_prospectTextView];
    
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _callButton.frame = CGRectMake(294, _phoneLabel.frame.origin.y, 48, 48);
    _callButton.tag = 0;
    _callButton.layer.cornerRadius = 10;
    [_callButton setClipsToBounds:YES];
    [_callButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_callButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_callButton];
    
    _secondaryCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondaryCallButton.frame = CGRectMake(354, _secondaryPhoneLabel.frame.origin.y, 48, 48);
    _secondaryCallButton.tag = 1;
    _secondaryCallButton.layer.cornerRadius = 10;
    [_secondaryCallButton setClipsToBounds:YES];
    [_secondaryCallButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_secondaryCallButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_secondaryCallButton];
    
    _emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _emailButton.frame = CGRectMake(_prospectTextView.frame.origin.x, 900, 100, 48);
    _emailButton.layer.cornerRadius = 10;
    [_emailButton setClipsToBounds:YES];
    [_emailButton addTarget:self action:@selector(viewEmails:) forControlEvents:UIControlEventTouchUpInside];
    [_emailButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_emailButton setTitle:@"E-mails" forState:UIControlStateNormal];
    [_scrollView addSubview:_emailButton];
    
    _viewCallsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _viewCallsButton.frame = CGRectMake(254, 900, 100, 48);
    _viewCallsButton.layer.cornerRadius = 10;
    [_viewCallsButton setClipsToBounds:YES];
    [_viewCallsButton addTarget:self action:@selector(viewCalls:) forControlEvents:UIControlEventTouchUpInside];
    [_viewCallsButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_viewCallsButton setTitle:@"Calls" forState:UIControlStateNormal];
    [_scrollView addSubview:_viewCallsButton];
}

-(void)layoutForIphone6PlusWithContentSize:(CGSize)contentSize
{    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _firstNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 294, 46)];
    _firstNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _firstNameLabel.text = [NSString stringWithFormat:@"First Name:         %@", _prospect[FirstName]];
    _firstNameLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_firstNameLabel];
    
    _lastNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _firstNameLabel.frame.origin.y+94, 294, 46)];
    _lastNameLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _lastNameLabel.text = [NSString stringWithFormat:@"Last Name:         %@", _prospect[LastName]];;
    [_scrollView addSubview:_lastNameLabel];
    
    _phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _lastNameLabel.frame.origin.y+94, 294, 46)];
    _phoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _phoneLabel.text = [NSString stringWithFormat:@"Phone:         %@", _prospect[Phone]];
    [_scrollView addSubview:_phoneLabel];
    
    _secondaryPhoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _phoneLabel.frame.origin.y+94, 294, 46)];
    _secondaryPhoneLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _secondaryPhoneLabel.text = [NSString stringWithFormat:@"Secondary Phone:    %@", _prospect[SecondaryPhone]];
    [_scrollView addSubview:_secondaryPhoneLabel];
    
    _emailLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _secondaryPhoneLabel.frame.origin.y+94, 294, 46)];
    _emailLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _emailLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _prospect[Email]];
    [_scrollView addSubview:_emailLabel];
    
    _prospectTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _emailLabel.frame.origin.y+94, 294, 200)];
    _prospectTextView.layer.borderWidth = 1.0;
    _prospectTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _prospectTextView.layer.cornerRadius = 10.0;
    _prospectTextView.clipsToBounds = YES;
    _prospectTextView.backgroundColor = [UIColor whiteColor];
    _prospectTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _prospectTextView.text = _prospect[Notes];
    _prospectTextView.editable = NO;
    [_scrollView addSubview:_prospectTextView];
    
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _callButton.frame = CGRectMake(294, _phoneLabel.frame.origin.y, 48, 48);
    _callButton.tag = 0;
    _callButton.layer.cornerRadius = 10;
    [_callButton setClipsToBounds:YES];
    [_callButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_callButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_callButton];
    
    _secondaryCallButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _secondaryCallButton.frame = CGRectMake(354, _secondaryPhoneLabel.frame.origin.y, 48, 48);
    _secondaryCallButton.tag = 1;
    _secondaryCallButton.layer.cornerRadius = 10;
    [_secondaryCallButton setClipsToBounds:YES];
    [_secondaryCallButton addTarget:self action:@selector(callProspect:) forControlEvents:UIControlEventTouchUpInside];
    [_secondaryCallButton setBackgroundImage:[UIImage imageNamed:@"Phone.png"] forState:UIControlStateNormal];
    [_scrollView addSubview:_secondaryCallButton];
    
    _emailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _emailButton.frame = CGRectMake(_prospectTextView.frame.origin.x, 900, 100, 48);
    _emailButton.layer.cornerRadius = 10;
    [_emailButton setClipsToBounds:YES];
    [_emailButton addTarget:self action:@selector(viewEmails:) forControlEvents:UIControlEventTouchUpInside];
    [_emailButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_emailButton setTitle:@"E-mails" forState:UIControlStateNormal];
    [_scrollView addSubview:_emailButton];
    
    _viewCallsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _viewCallsButton.frame = CGRectMake(254, 900, 100, 48);
    _viewCallsButton.layer.cornerRadius = 10;
    [_viewCallsButton setClipsToBounds:YES];
    [_viewCallsButton addTarget:self action:@selector(viewCalls:) forControlEvents:UIControlEventTouchUpInside];
    [_viewCallsButton setBackgroundImage:[UIImage imageNamed:@"lightReadGradient.jpeg"] forState:UIControlStateNormal];
    [_viewCallsButton setTitle:@"Calls" forState:UIControlStateNormal];
    [_scrollView addSubview:_viewCallsButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)callProspect:(UIButton *)sender
{
    NSString *phNo;
    
    if(sender.tag == 0)
    {
        phNo = _prospect[Phone];
    }
    
    else
    {
        phNo = _prospect[SecondaryPhone];
    }
    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phNo]];
    
    
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        
        [[UIApplication sharedApplication] openURL:phoneUrl];
        _prospectCall = [[CTCall alloc]init];
        [_prospectCall callState];
        
        _callCenter = [[CTCallCenter alloc]init];
        __weak ProspectDetailViewController *s = self;
        // Assign event handler. This will be called on each call event
        self.callCenter.callEventHandler = ^(CTCall* call) {
            
            // If call ended
            if (call.callState == CTCallStateDisconnected)
            {
                NSLog(@"Call ended.");
                dispatch_async(dispatch_get_main_queue(), ^{
                    [s performSegueWithIdentifier:@"toAddCall" sender:s];
                });
            }
        };

        
    } else
        
    {
        
        UIAlertView  *calert = [[UIAlertView alloc]initWithTitle:@"Alert"message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok"otherButtonTitles:nil, nil];
        
        [calert show];
        
    }
}

-(void)viewCalls:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"toCallLog" sender:self];
}

-(void)viewEmails:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"toMessageLog" sender:self];
}

-(void)sendMessageWithFields:(NSString *)firstName andEmail:(NSString *)email andSubject:(NSString *)subject andBody:(NSString *)body withSender:(UIButton *)sender
{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    
    [mc setSubject:subject];
    [mc setMessageBody:body isHTML:NO];
    [mc setToRecipients:@[_prospect[Email]]];
    
    _recipient = firstName;
    _email = email;
    _subject = subject;
    _body = body;
    
    if([subject isEqualToString:@""] || [body isEqualToString:@""] || email == nil)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"You must have a valid e-mail, body, and subject" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
    }
    
    else
    {
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            [self addMessage];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)addMessage
{
    PFObject *messageObject = [PFObject objectWithClassName:@"Emails"];
    messageObject[@"Recipient"] = _recipient;
    messageObject[@"Address"] = _email;
    messageObject[@"Subject"] = _subject;
    messageObject[@"Body"] = _body;
    messageObject[@"DateSent"] = [NSDate date];

    PFRelation *relation = [messageObject relationForKey:@"User"];
    [relation addObject:[PFUser currentUser]];
    
    PFRelation *prospectRelation = [messageObject relationForKey:@"Prospect"];
    [prospectRelation addObject:_prospect];
    [messageObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(succeeded)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"E-mail Saved" message:@"The e-mail has been successfuly saved to your e-mail list." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
        
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Failed to Save E-mail" message:@"The e-mail was not saved to your e-mail list. Please try again" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alertView show];
        }
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[AddMessageViewController class]])
    {
        AddMessageViewController *mController = (AddMessageViewController *)segue.destinationViewController;
        mController.delegate = self;
        mController.prospect = _prospect;
    }
    
    else
    {
        AddCallViewController *cController = (AddCallViewController *)segue.destinationViewController;
        cController.prospect = _prospect;
    }
}

@end
