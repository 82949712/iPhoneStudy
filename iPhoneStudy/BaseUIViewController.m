//
//  BaseUIViewController.m
//  iPhoneStudy
//
//  Created by apple on 13-12-18.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "BaseUIViewController.h"

@interface BaseUIViewController ()

@end

@implementation BaseUIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //set navigation bar not transparent so that it pushes down the contents
    self.navigationController.navigationBar.translucent = NO;
    
    //create the logout button
    UIBarButtonItem *btnLogout = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Logout"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                  action:@selector(logout:)];
    self.navigationItem.rightBarButtonItem = btnLogout;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)logout: (UIBarButtonItem *)sender
{
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Logout" message:@"Logging user out ..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
