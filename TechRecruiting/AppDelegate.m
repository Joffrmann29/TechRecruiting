//
//  AppDelegate.m
//  TechRecruiting
//
//  Created by Joffrey Mann on 5/28/15.
//  Copyright (c) 2015 Nutech. All rights reserved.
//

#import "AppDelegate.h"
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"
#import "LoginViewController.h"

static NSString * const kUserHasOnboardedKey = @"user_has_onboarded";

@interface AppDelegate ()

@end

@implementation AppDelegate
BOOL userHasOnboarded;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"r3j4cZHErISMxMkjH0JppxVdfeHPwmaVjh6pUbjk"
                  clientKey:@"aLLos0N9yRf4ztxcXa8nsLVqqafK3L29kTg8Pq2X"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    
    // determine if the user has onboarded yet or not
    userHasOnboarded = [[NSUserDefaults standardUserDefaults] boolForKey:kUserHasOnboardedKey];
    
    // if the user has already onboarded, just set up the normal root view controller
    // for the application, but don't animate it because there's no transition in this case
    if (userHasOnboarded) {
        [self showFirstScreen];
    }
    
    // otherwise set the root view controller to the onboarding view controller
    else {
        self.window.rootViewController = [self generateFirstDemoVC];
    }
    return YES;
}

- (void)handleOnboardingCompletion {
    // set that we have completed onboarding so we only do it once... for demo
    // purposes we don't want to have to set this every time so I'll just leave
    // this here...
    //    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserHasOnboardedKey];
    
    // animate the transition to the main application
    [self setupNormalRootViewControllerAnimated:YES];
}

- (OnboardingViewController *)generateFirstDemoVC {
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:@"Welcome to Nutech Recruiting" body:@"Manage your candidate database more efficiently in one location." image:[UIImage imageNamed:@"blue"] buttonText:nil action:^{nil;
    }];
    
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"View specific details and statuses of each candidate." body:@"You can e-mail and call candidates from within the app and log all communication info." image:[UIImage imageNamed:@"red"] buttonText:nil action:^{nil;
    }];
    secondPage.movesToNextViewController = YES;
    secondPage.viewDidAppearBlock = ^{nil;
    };
    
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"Custom E-mail Form" body:@"Our custom e-mail form helps users efficiently send e-mails." image:[UIImage imageNamed:@"yellow"] buttonText:@"Get Started" action:^{
        [self handleOnboardingCompletion];
    }];
    
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"ProspectList.png"] contents:@[firstPage, secondPage, thirdPage]];
    onboardingVC.shouldFadeTransitions = YES;
    onboardingVC.fadePageControlOnLastPage = YES;
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    onboardingVC.allowSkipping = YES;
    onboardingVC.skipHandler = ^{
        [self handleOnboardingCompletion];
    };
    
    return onboardingVC;
}
    
- (void)setupNormalRootViewControllerAnimated:(BOOL)animated {
        // create whatever your root view controller is going to be, in this case just a simple view controller
        // wrapped in a navigation controller
        LoginViewController *mainVC = [LoginViewController new];
    
        // if we want to animate the transition, do it
        if (animated) {
            [UIView transitionWithView:self.window duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                [self showFirstScreen];
            } completion:nil];
        }
        
        // otherwise just set the root view controller normally without animation
        else {
            self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:mainVC];
        }
}

-(void)showFirstScreen {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:kUserHasOnboardedKey];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSString *) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}
- (NSString *) platformString{
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

@end
