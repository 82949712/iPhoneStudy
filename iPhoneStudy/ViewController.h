//
//  ViewController.h
//  iPhoneStudy
//
//  Created by apple on 13-11-21.
//  Copyright (c) 2013年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableCell.h"
#import "BaseUIViewController.h"

@interface ViewController : BaseUIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray* _data;
    NSMutableArray* _thumbnails;
    UIView* _flipContainer;
}
@property (weak, nonatomic) IBOutlet UIButton *btnMain;

- (IBAction)btnMainClick:(id)sender;

//use weak for outlet since it's child to parent
@property (weak, nonatomic) IBOutlet UITableView *tableMain;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnLogou;
@property (weak, nonatomic) IBOutlet MyTableCell *tableCell;

@end
