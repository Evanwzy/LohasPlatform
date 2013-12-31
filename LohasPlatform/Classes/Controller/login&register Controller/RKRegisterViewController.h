//
//  RKRegisterViewController.h
//  LohasPlatform
//
//  Created by Evan on 13-12-17.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "UIKeyboardViewController.h"

@interface RKRegisterViewController : UIViewController <UIKeyboardViewControllerDelegate, UIGestureRecognizerDelegate> {
    UIKeyboardViewController *keyBoardController;
}


@property (retain, nonatomic) UIImageView *backgroundImageV;

@property (retain, nonatomic) UIImageView *accountImageV;
@property (retain, nonatomic) UIImageView *verityImageV;
@property (retain, nonatomic) UIImageView *passwordImageV;
@property (retain, nonatomic) UIImageView *confirmImageV;

@property (retain, nonatomic) UITextField *accountText;
@property (retain, nonatomic) UITextField *verityText;
@property (retain, nonatomic) UITextField *passwordText;
@property (retain, nonatomic) UITextField *confirmText;

@property (retain, nonatomic) UIImageView *accountIcon;
@property (retain, nonatomic) UIImageView *passwordIcon;
@property (retain, nonatomic) UIImageView *loginIcon;

@property (retain, nonatomic) UIButton *verityBtn;
@property (retain, nonatomic) UIButton *registerBtn;
@property (retain, nonatomic) UIButton *loginBtn;

@end
