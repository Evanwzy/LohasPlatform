//
//  RKMainViewController.m
//  LohasPlatform
//
//  Created by Evan on 13-12-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKMainViewController.h"

@interface RKMainViewController ()

@end

@implementation RKMainViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma - singleton

static RKMainViewController *_naviControllerManager;

+(RKMainViewController *)sharedNaviController {
    @synchronized(self){
        if (_naviControllerManager == nil) {
            _naviControllerManager = [[self alloc]init];
        }
    }
    return _naviControllerManager;
}

+(RKMainViewController *)sharedNaviController:(UIViewController *)controller {
    @synchronized(self){
        _naviControllerManager = [[self alloc]initWithRootViewController:controller];
    }
    return _naviControllerManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
