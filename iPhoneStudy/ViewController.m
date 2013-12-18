//
//  ViewController.m
//  iPhoneStudy
//
//  Created by apple on 13-11-21.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MyTableCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    
    //loading data from listdata.plist file
    NSString* path = [[NSBundle mainBundle] pathForResource:@"listdata" ofType:@"plist"];
    NSDictionary* dictionary = [[NSDictionary alloc]initWithContentsOfFile:path];
    _data = [[dictionary objectForKey:@"Name"] mutableCopy];
    _thumbnails = [[dictionary objectForKey:@"Thumbnail"] mutableCopy];
    
    //loading data from default settings
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int maxRows = [[defaults stringForKey:@"maxRow" ] intValue];
    self.btnMain.titleLabel.text = [NSString stringWithFormat:@"%d", maxRows];
    
    self.title = @"List";
    
    
//    //Set bar not transparent, so it pushes the content down
//    self.navigationController.navigationBar.translucent = NO;
//    //set the bar color
//    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
//    //set bar button color
//    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:@{UITextAttributeTextColor: [UIColor whiteColor]} forState:UIControlStateNormal];
//    //set bar title text color
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//    //set bar back arrow color
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];


    //self.hidesBottomBarWhenPushed = true;

    _flipContainer = [[UIView alloc ] initWithFrame:CGRectMake( 0.0f, 0.0f, 200.0f, 200.0f)];
    [self.view addSubview:_flipContainer];

    [self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnMainClick:(id)sender {
    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Something" message:@"Show button" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MyTableCell *cell = (MyTableCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //self.tableCell = [[MyTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //NSArray* nib=
        [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        //cell = (MyTableCell*)[nib objectAtIndex:0];
    }
    
    // Configure the cell...
    NSString* str = [_data objectAtIndex:indexPath.row];
    NSString* imageName = [_thumbnails objectAtIndex:indexPath.row];
    //    cell.textLabel.text = str;
    //    cell.imageView.image = [UIImage imageNamed:imageName];
    
    self.tableCell.lblListText.text = str;
    self.tableCell.myImageView.image = [UIImage imageNamed:imageName];
    
    cell = self.tableCell;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    //cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
//    UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"Something" message:@"Show button" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//    [alert show];
    
    DetailViewController* detailsVC = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil];
    //1st way to display details view: use navigation
    //[self.navigationController pushViewController:detailsVC animated:TRUE];
    
    //if no navigation viewctonroller
    //[self presentViewController:detailsVC animated:TRUE completion:nil];
    

    UIView* flipbox = [[UIView alloc ] initWithFrame:_flipContainer.bounds];
    flipbox.backgroundColor = [UIColor redColor];
    [UIView transitionWithView:_flipContainer duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromBottom //change to whatever animation you like
                    animations:^ { [_flipContainer addSubview:flipbox]; }
                    completion:nil];
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_data removeObjectAtIndex:indexPath.row];
    [_thumbnails removeObjectAtIndex: indexPath.row];

    [tableView reloadData];
}

@end
