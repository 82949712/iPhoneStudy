//
//  AppDelegate.m
//  iPhoneStudy
//
//  Created by apple on 13-11-21.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "AppStart.h"
#import "NavigationController.h"
#import "MoreViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    //load default values
    [AppStart registerDefault];
    
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController* viewController;
    
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }



    NavigationController* navigationController = [[NavigationController alloc]initWithRootViewController:viewController];

    MoreViewController* moreViewController = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];

    UITabBarController* tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[navigationController, moreViewController];
    
    self.viewController = (ViewController*)tabBarController;
    //self.viewController = viewController;
    
    [[[tabBarController.viewControllers objectAtIndex:0]tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"Apple.gif"] withFinishedUnselectedImage:[UIImage imageNamed:@"Pear.gif"]];

    [[[tabBarController.viewControllers objectAtIndex:1]tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"Orange.gif"] withFinishedUnselectedImage:[UIImage imageNamed:@"Strawberry.gif"]];
    
    
    //set navigation bar style
    //Set bar not transparent, so it pushes the content down
    //[[UINavigationBar appearance] setTranslucent:NO];
    //[[UINavigationBar appearance] setBackgroundColor:[UIColor blueColor]];
    //[[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];

    //set the bar color
    [UINavigationBar appearance].barTintColor = [UIColor blueColor];
    //set bar button color
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor whiteColor]} forState:UIControlStateNormal];
    //set bar title text color
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    //set bar back arrow color
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    //add logout button here
//    
//    
//    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logou" style:UIBarButtonItemStyleBordered target:viewController action:nil];
//    viewController.navigationItem.rightBarButtonItem = rightBarBtn;
//    
//}
//
//-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"Logou" style:UIBarButtonItemStyleBordered target:viewController action:nil];
//    viewController.navigationItem.rightBarButtonItem = rightBarBtn;
//}

@end
