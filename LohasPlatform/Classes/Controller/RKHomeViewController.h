//
//  RKHomeViewController.h
//  LohasPlatform
//
//  Created by Evan on 13-12-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Common.h"

#import "RKLoginViewController.h"
#import "RKRegisterViewController.h"

@interface RKHomeViewController : UIViewController <UIScrollViewDelegate>

@property (retain, nonatomic) UIScrollView  *imageSV;
@property (retain, nonatomic) UIButton      *loginBtn;
@property (retain, nonatomic) UIButton      *registerBtn;
@property (retain, nonatomic) UIPageControl *pageCtr;

@end
