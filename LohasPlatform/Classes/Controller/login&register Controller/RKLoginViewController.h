//
//  RKLoginViewController.h
//  LohasPlatform
//
//  Created by Evan on 13-12-12.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "UIKeyboardViewController.h"

@interface RKLoginViewController : UIViewController <UIKeyboardViewControllerDelegate, UIGestureRecognizerDelegate> {
    UIKeyboardViewController *keyBoardController;
}

@property (retain, nonatomic) UIImageView *topImageV;
@property (retain, nonatomic) UIImageView *registerImageV;
@property (retain, nonatomic) UIImageView *forgetImageV;
@property (retain, nonatomic) UIImageView *accountTextBg;
@property (retain, nonatomic) UIImageView *passwordTextBg;
@property (retain, nonatomic) UITextField *accountText;
@property (retain, nonatomic) UITextField *passwordText;

@property (retain, nonatomic) UIButton *loginBtn;
@property (retain, nonatomic) UIButton *forgetBtn;
@property (retain, nonatomic) UIButton *registerBtn;

@end
