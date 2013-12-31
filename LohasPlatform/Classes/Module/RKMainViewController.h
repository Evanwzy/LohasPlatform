//
//  RKMainViewController.h
//  LohasPlatform
//
//  Created by Evan on 13-12-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKMainViewController : UINavigationController

+ (RKMainViewController *)sharedNaviController;
+ (RKMainViewController *)sharedNaviController:(UIViewController *)controller;

@end
