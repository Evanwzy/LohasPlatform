//
//  RKUserViewController.h
//  LohasPlatform
//
//  Created by Evan on 13-12-17.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

#import "RKMarksTableCell.h"

@interface RKUserViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

@property (retain, nonatomic) UIImageView *userImageV;
@property (retain, nonatomic) UIImageView *userBg;
@property (retain, nonatomic) UIImageView *topBg;
@property (retain, nonatomic) UIImageView *moneyImageV;
@property (retain, nonatomic) UIImageView *marksImageV;

@property (retain, nonatomic) UILabel *nameLabel;

@property (retain, nonatomic) UITableView *tableView;

@property (retain, nonatomic) UIButton *moneyBtn;
@property (retain, nonatomic) UIButton *marksBtn;

@property (retain, nonatomic) NSArray *dataArray;

@end
