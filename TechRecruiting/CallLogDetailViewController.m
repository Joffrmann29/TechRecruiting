//
//  CallLogDetailViewController.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "CallLogDetailViewController.h"

@interface CallLogDetailViewController ()

@end

@implementation CallLogDetailViewController

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
        _scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.4);
        [self layoutForIphone6Plus];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone7,2"]){
        //call layout method for Iphone 6 Plus
        [self layoutForIPhone6];
    }
    
    else if([[appDelegate platformString]isEqualToString:@"iPhone 5"] || [[appDelegate platformString]isEqualToString:@"iPhone 5C"] || [[appDelegate platformString]isEqualToString:@"iPhone 5S"]){
        self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.8);
        //call layout method for Iphone 5, 5C, and 5S
        [self layoutForIphone5WithContentSize:self.scrollView.contentSize];
    }
    
    else
    {
        [self layoutForIPhone4S];
    }
    
    self.navigationItem.title = @"Call Detail";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)layoutForIPhone4S
{
    self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.3);
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
    
    _natureLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 212, 255, 46)];
    _natureLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _natureLabel.text = [NSString stringWithFormat:@"Recipient:         %@", _call[@"NatureOfCall"]];
    _natureLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_natureLabel];
    
    _durationLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _natureLabel.frame.origin.y+94, 255, 46)];
    _durationLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _durationLabel.text = [NSString stringWithFormat:@"Duration:         %@", _call[@"Duration"]];;
    [_scrollView addSubview:_durationLabel];
    
    _resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _durationLabel.frame.origin.y+94, 255, 46)];
    _resultLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _resultLabel.text = [NSString stringWithFormat:@"Result:         %@", _call[@"Result"]];
    [_scrollView addSubview:_resultLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, _resultLabel.frame.origin.y+94, 255, 46)];
    _dateLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _dateLabel.numberOfLines = 0;
    NSDate *createdDate = _call[@"DateCalled"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyyy @ hh:mm"];
    NSString *stringFromDate = [formatter stringFromDate:createdDate];
    _dateLabel.text = [NSString stringWithFormat:@"Date:    %@", stringFromDate];
    [_scrollView addSubview:_dateLabel];
    
    _notesTextView = [[UITextView alloc]initWithFrame:CGRectMake(30, _dateLabel.frame.origin.y+94, 255, 200)];
    _notesTextView.layer.borderWidth = 1.0;
    _notesTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _notesTextView.layer.cornerRadius = 10.0;
    _notesTextView.clipsToBounds = YES;
    _notesTextView.backgroundColor = [UIColor whiteColor];
    _notesTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _notesTextView.text = _call[@"Notes"];
    _notesTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_notesTextView];
}

-(void)layoutForIPhone6
{
    self.scrollView.contentSize = CGSizeMake(0, self.view.frame.size.height*1.5);
    
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 295, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _natureLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 255, 46)];
    _natureLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _natureLabel.text = [NSString stringWithFormat:@"Recipient:         %@", _call[@"NatureOfCall"]];
    _natureLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_natureLabel];
    
    _durationLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _natureLabel.frame.origin.y+94, 255, 46)];
    _durationLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _durationLabel.text = [NSString stringWithFormat:@"Duration:         %@", _call[@"Duration"]];;
    [_scrollView addSubview:_durationLabel];
    
    _resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _durationLabel.frame.origin.y+94, 255, 46)];
    _resultLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _resultLabel.text = [NSString stringWithFormat:@"Result:         %@", _call[@"Result"]];
    [_scrollView addSubview:_resultLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _resultLabel.frame.origin.y+94, 255, 46)];
    _dateLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _dateLabel.numberOfLines = 0;
    NSDate *createdDate = _call[@"DateCalled"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyyy @ hh:mm"];
    NSString *stringFromDate = [formatter stringFromDate:createdDate];
    _dateLabel.text = [NSString stringWithFormat:@"Date:    %@", stringFromDate];
    [_scrollView addSubview:_dateLabel];
    
    _notesTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _dateLabel.frame.origin.y+94, 255, 200)];
    _notesTextView.layer.borderWidth = 1.0;
    _notesTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _notesTextView.layer.cornerRadius = 10.0;
    _notesTextView.clipsToBounds = YES;
    _notesTextView.backgroundColor = [UIColor whiteColor];
    _notesTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _notesTextView.text = _call[@"Notes"];
    _notesTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_notesTextView];
}

-(void)layoutForIphone6Plus
{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 1250)];
    _imgView.image = [UIImage imageNamed:@"offWhiteGradientBG.jpg"];
    [_scrollView addSubview:_imgView];
    
    _logoView = [[UIImageView alloc]initWithFrame:CGRectMake(40, 20, 334, 128)];
    _logoView.image = [UIImage imageNamed:@"NutechLogo.png"];
    [_imgView addSubview:_logoView];
    
    _natureLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 212, 294, 46)];
    _natureLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _natureLabel.text = [NSString stringWithFormat:@"Nature of Call:         %@", _call[@"NatureOfCall"]];
    _natureLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_natureLabel];
    
    _durationLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _natureLabel.frame.origin.y+94, 294, 46)];
    _durationLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _durationLabel.text = [NSString stringWithFormat:@"Duration:         %@", _call[@"Duration"]];;
    [_scrollView addSubview:_durationLabel];
    
    _resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _durationLabel.frame.origin.y+94, 294, 46)];
    _resultLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _resultLabel.text = [NSString stringWithFormat:@"Result:         %@", _call[@"Result"]];
    [_scrollView addSubview:_resultLabel];
    
    _dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, _resultLabel.frame.origin.y+94, 294, 46)];
    _dateLabel.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _dateLabel.numberOfLines = 0;
    NSDate *createdDate = _call[@"DateCalled"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyyy @ hh:mm"];
    NSString *stringFromDate = [formatter stringFromDate:createdDate];
    _dateLabel.text = [NSString stringWithFormat:@"Date:    %@", stringFromDate];
    [_scrollView addSubview:_dateLabel];
    
    _notesTextView = [[UITextView alloc]initWithFrame:CGRectMake(60, _dateLabel.frame.origin.y+94, 294, 200)];
    _notesTextView.layer.borderWidth = 1.0;
    _notesTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _notesTextView.layer.cornerRadius = 10.0;
    _notesTextView.clipsToBounds = YES;
    _notesTextView.backgroundColor = [UIColor whiteColor];
    _notesTextView.textColor = [UIColor colorWithRed:155.0f / 255.0f green:29.0f / 255.0f blue:35.0f / 255.0f alpha:1.0f];
    _notesTextView.text = _call[@"Notes"];
    _notesTextView.font = [UIFont fontWithName:@"Helvetica" size:17.0];
    [_scrollView addSubview:_notesTextView];
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
