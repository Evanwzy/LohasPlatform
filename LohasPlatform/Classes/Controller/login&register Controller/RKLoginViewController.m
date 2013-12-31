//
//  RKLoginViewController.m
//  LohasPlatform
//
//  Created by Evan on 13-12-12.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKLoginViewController.h"

#import "RKUserViewController.h"
#import "RKRegisterViewController.h"

@interface RKLoginViewController ()

@end

@implementation RKLoginViewController

@synthesize topImageV, accountTextBg, passwordTextBg, accountText, passwordText, loginBtn, registerBtn, forgetBtn, forgetImageV, registerImageV;

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
    
    //滑动
    
    self.view.userInteractionEnabled =YES;
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipeLeft setNumberOfTouchesRequired:1];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionRight];
    swipeLeft.delegate =self;
    [self.view addGestureRecognizer:swipeLeft];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setUI];
    
    keyBoardController=[[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    
    [keyBoardController addToolbarToKeyboard];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - setupUI

- (void)setUI {
    /*!
     *  set up background image
     *
     *  @since v1.0
     */
    registerImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personIcon"]];
    forgetImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"keyIcon"]];
    
    accountTextBg =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    passwordTextBg =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    
    
    /*!
     *  set up textField
     *
     *  @since v1.0
     */
    accountText =[[UITextField alloc]init];
    passwordText =[[UITextField alloc]init];
    
    accountText.placeholder =@"手机号";
    passwordText.placeholder =@"密码";
    
    /*!
     *  set up button
     *
     *  @since v1.0
     */
    loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setImage:[UIImage imageNamed:@"mainLoginBtn"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    registerBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setTitle:@"注册账户" forState:UIControlStateNormal];
    registerBtn.titleLabel.font =[UIFont systemFontOfSize:16.0f];
    [registerBtn setTitleColor:[UIColor grayColor]forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    forgetBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetBtn.titleLabel.font =[UIFont systemFontOfSize:16.0f];
    [forgetBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    if (IS_IPHONE_5) {
        self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"imageBg"]];
        topImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginImg"]];
        
        [accountTextBg setFrame:CGRectMake(36.0f, 190.0f, 248.0f, 40.5f)];
        [passwordTextBg setFrame:CGRectMake(36.0f, 250.0f, 248.0f, 40.5f)];
        [loginBtn setFrame:CGRectMake(36.0f, 310.0f, 248.0f, 40.5f)];
        [registerBtn setFrame:CGRectMake(36.0f, 390.0f, 130.0f, 20.0f)];
        [forgetBtn setFrame:CGRectMake(36.0f, 430.0f, 130.0f, 20.0f)];
        
        [registerImageV setFrame:CGRectMake(36.0f, 390.5f, 20.5f, 19.0f)];
        [forgetImageV setFrame:CGRectMake(36.0f, 430.5f, 20.5f, 19.0f)];

        [accountText setFrame:CGRectMake(40.0f, 190.0f, 244.0f, 40.5f)];
        [passwordText setFrame:CGRectMake(40.0f, 250.0f, 244.0f, 40.5f)];
        
        if (!IS_IOS7) {
            [accountTextBg setFrame:CGRectMake(36.0f, 170.0f, 248.0f, 40.5f)];
            [passwordTextBg setFrame:CGRectMake(36.0f, 230.0f, 248.0f, 40.5f)];
            [loginBtn setFrame:CGRectMake(36.0f, 290.0f, 248.0f, 40.5f)];
            [registerBtn setFrame:CGRectMake(36.0f, 370.0f, 130.0f, 20.0f)];
            [forgetBtn setFrame:CGRectMake(36.0f, 410.0f, 130.0f, 20.0f)];
            
            [registerImageV setFrame:CGRectMake(36.0f, 370.5f, 20.5f, 19.0f)];
            [forgetImageV setFrame:CGRectMake(36.0f, 410.5f, 20.5f, 19.0f)];
            
            [accountText setFrame:CGRectMake(40.0f, 170.0f, 244.0f, 40.5f)];
            [passwordText setFrame:CGRectMake(40.0f, 230.0f, 244.0f, 40.5f)];
        }
        
        
        
    }else {
        self.view.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"imageBg_480"]];
        
        topImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginImg"]];
        
        [accountTextBg setFrame:CGRectMake(36.0f, 190.0f, 248.0f, 40.5f)];
        [passwordTextBg setFrame:CGRectMake(36.0f, 250.0f, 248.0f, 40.5f)];
        [loginBtn setFrame:CGRectMake(36.0f, 310.0f, 248.0f, 40.5f)];
        [registerBtn setFrame:CGRectMake(36.0f, 370.0f, 130.0f, 20.0f)];
        [forgetBtn setFrame:CGRectMake(36.0f, 410.0f, 130.0f, 20.0f)];
        
        [registerImageV setFrame:CGRectMake(36.0f, 370.5f, 20.5f, 19.0f)];
        [forgetImageV setFrame:CGRectMake(36.0f, 410.5f, 20.5f, 19.0f)];
        
        [accountText setFrame:CGRectMake(40.0f, 190.0f, 244.0f, 40.5f)];
        [passwordText setFrame:CGRectMake(40.0f, 250.0f, 244.0f, 40.5f)];
        
        if (!IS_IOS7) {
            [accountTextBg setFrame:CGRectMake(36.0f, 170.0f, 248.0f, 40.5f)];
            [passwordTextBg setFrame:CGRectMake(36.0f, 230.0f, 248.0f, 40.5f)];
            [loginBtn setFrame:CGRectMake(36.0f, 290.0f, 248.0f, 40.5f)];
            [registerBtn setFrame:CGRectMake(36.0f, 350.0f, 130.0f, 20.0f)];
            [forgetBtn setFrame:CGRectMake(36.0f, 390.0f, 130.0f, 20.0f)];
            
            [registerImageV setFrame:CGRectMake(36.0f, 350.5f, 20.5f, 19.0f)];
            [forgetImageV setFrame:CGRectMake(36.0f, 390.5f, 20.5f, 19.0f)];
            
            [accountText setFrame:CGRectMake(40.0f, 170.0f, 244.0f, 40.5f)];
            [passwordText setFrame:CGRectMake(40.0f, 230.0f, 244.0f, 40.5f)];
        }
    }
    
    [self.view addSubview:topImageV];
    [self.view addSubview:accountTextBg];
    [self.view addSubview:passwordTextBg];
    [self.view addSubview:accountText];
    [self.view addSubview:passwordText];
    [self.view addSubview:loginBtn];
    [self.view addSubview:registerImageV];
    [self.view addSubview:forgetImageV];
    [self.view addSubview:registerBtn];
    [self.view addSubview:forgetBtn];
    
}

#pragma mark - button action

- (void)loginBtnPressed:(id)sender {
#warning test
    if (1) {
        RKUserViewController *uvCtr =[[RKUserViewController alloc]init];
        [self.navigationController pushViewController:uvCtr animated:YES];
    }else {
        [Common showNetWorkingAlertWithMessage:@"请输入正确的账号和密码"];
    }
}

- (void)registerBtnPressed:(id)sender {
    RKRegisterViewController *rvCtr =[[RKRegisterViewController alloc]init];
    [self.navigationController pushViewController:rvCtr animated:YES];
}

- (void)forgetBtnPressed:(id)sender {
    
}

/*!
 *  Swipe
 *
 *  @param gestureRecognizer Swipe
 *
 *  @since v1.0
 */
- (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer {
    CGPoint location = [gestureRecognizer locationInView:self.view];
    
    if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        location.x -= 220.0;
        
    }
    else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        location.y -= 220.0;
    }
    else if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        location.y += 220.0;
    }
    else if(gestureRecognizer.direction ==UISwipeGestureRecognizerDirectionRight){
        location.x += 220.0;
        [UIView animateWithDuration:0.01 animations:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];

    }
}

@end
