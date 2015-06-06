//
//  MessageDetailViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "MessageDetailViewController.h"

@interface MessageDetailViewController ()

@end

@implementation MessageDetailViewController

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
        [self layoutForIphone6Plus];
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
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.height, self.view.frame.size.height*1.3);
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
    
    _recipientLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 212, 255, 46)];
    _recipientLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _recipientLabel.text = [NSString stringWithFormat:@"Recipient:         %@", _message[@"Recipient"]];
    _recipientLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_recipientLabel];
    
    _subjectLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _recipientLabel.frame.origin.y+94, 255, 46)];
    _subjectLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _subjectLabel.text = [NSString stringWithFormat:@"Subject:         %@", _message[@"Subject"]];;
    [_scrollView addSubview:_subjectLabel];
    
    _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _subjectLabel.frame.origin.y+94, 255, 46)];
    _bodyLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _bodyLabel.text = [NSString stringWithFormat:@"Body:         %@", _message[@"Body"]];
    [_scrollView addSubview:_bodyLabel];
    
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _bodyLabel.frame.origin.y+94, self.view.frame.size.width, 46)];
    _addressLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _addressLabel.numberOfLines = 0;
    _addressLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _message[@"Address"]];
    [_scrollView addSubview:_addressLabel];
}

-(void)layoutForIPhone6
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _recipientLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 255, 46)];
    _recipientLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _recipientLabel.text = [NSString stringWithFormat:@"Recipient:         %@", _message[@"Recipient"]];
    _recipientLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_recipientLabel];
    
    _subjectLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _recipientLabel.frame.origin.y+94, 255, 46)];
    _subjectLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _subjectLabel.text = [NSString stringWithFormat:@"Subject:         %@", _message[@"Subject"]];;
    [_scrollView addSubview:_subjectLabel];
    
    _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _subjectLabel.frame.origin.y+94, 255, 46)];
    _bodyLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _bodyLabel.text = [NSString stringWithFormat:@"Body:         %@", _message[@"Body"]];
    [_scrollView addSubview:_bodyLabel];
    
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _bodyLabel.frame.origin.y+94, self.view.frame.size.width, 46)];
    _addressLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _addressLabel.numberOfLines = 0;
    _addressLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _message[@"Address"]];
    [_scrollView addSubview:_addressLabel];
}

-(void)layoutForIphone6Plus
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _recipientLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 294, 46)];
    _recipientLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _recipientLabel.text = [NSString stringWithFormat:@"Recipient:         %@", _message[@"Recipient"]];
    _recipientLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_recipientLabel];
    
    _subjectLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _recipientLabel.frame.origin.y+94, 294, 46)];
    _subjectLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _subjectLabel.text = [NSString stringWithFormat:@"Subject:         %@", _message[@"Subject"]];;
    [_scrollView addSubview:_subjectLabel];
    
    _bodyLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _subjectLabel.frame.origin.y+94, 294, 46)];
    _bodyLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _bodyLabel.text = [NSString stringWithFormat:@"Body:         %@", _message[@"Body"]];
    [_scrollView addSubview:_bodyLabel];
    
    _addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _bodyLabel.frame.origin.y+94, 294, 46)];
    _addressLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _addressLabel.numberOfLines = 0;
    _addressLabel.text = [NSString stringWithFormat:@"E-mail:    %@", _message[@"Address"]];
    [_scrollView addSubview:_addressLabel];
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
