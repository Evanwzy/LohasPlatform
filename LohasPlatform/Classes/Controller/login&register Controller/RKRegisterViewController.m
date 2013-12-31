//
//  RKRegisterViewController.m
//  LohasPlatform
//
//  Created by Evan on 13-12-17.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKRegisterViewController.h"

#import "RKLoginViewController.h"

@interface RKRegisterViewController ()

@end

@implementation RKRegisterViewController

@synthesize accountImageV, accountText, accountIcon, passwordImageV, passwordText, passwordIcon, verityImageV, verityText, confirmImageV, confirmText, registerBtn, loginBtn, verityBtn, loginIcon, backgroundImageV;

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
     *  set up image
     *
     *  @since v1.0
     */
    self.view.backgroundColor =[UIColor whiteColor];

    accountImageV   =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    verityImageV    =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    passwordImageV  =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    confirmImageV   =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"textBg"]];
    
    accountIcon     =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personIcon"]];
    passwordIcon    =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"keyIcon"]];
    loginIcon       =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"personIcon"]];
    
    
    /*!
     *  set up textField
     *
     *  @since v1.0
     */
    accountText =[[UITextField alloc]init];
    verityText =[[UITextField alloc]init];
    passwordText =[[UITextField alloc]init];
    confirmText =[[UITextField alloc]init];
    
    accountText.placeholder =@"手机号";
    verityText.placeholder =@"验证码";
    passwordText.placeholder =@"密码";
    confirmText.placeholder =@"重复密码";
    
    
    
    /*!
     *  set up button
     *
     *  @since v1.0
     */
     verityBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [verityBtn setImage:[UIImage imageNamed:@"verityBtn"] forState:UIControlStateNormal];
    [verityBtn addTarget:self action:@selector(verityBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    registerBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setImage:[UIImage imageNamed:@"mainRegisterBtn"] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"已有账户，直接登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font =[UIFont systemFontOfSize:16.0f];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
#warning test
    if (0) {
        backgroundImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"registerBg"]];
        
        [backgroundImageV setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 407.0f)];
        
        [accountImageV setFrame:CGRectMake(36.0f, 160.0f, 248.0f, 40.5f)];
        [verityImageV setFrame:CGRectMake(36.0f, 220.0f, 166.0f, 40.5f)];
        [passwordImageV setFrame:CGRectMake(36.0f, 280.0f, 244.0f, 40.5f)];
        [confirmImageV setFrame:CGRectMake(36.0f, 340.0f, 244.0f, 40.5f)];
        
        [accountText setFrame:CGRectMake(40.0f, 160.0f, 244.0f, 40.5f)];
        [verityText setFrame:CGRectMake(40.0f, 220.0f, 164.0f, 40.5f)];
        [passwordText setFrame:CGRectMake(40.0f, 280.0f, 244.0f, 40.5f)];
        [confirmText setFrame:CGRectMake(40.0f, 340.0f, 244.0f, 40.5f)];
        
        
        if (!IS_IOS7) {
//            [accountTextBg setFrame:CGRectMake(36.0f, 170.0f, 248.0f, 40.5f)];
//            [passwordTextBg setFrame:CGRectMake(36.0f, 230.0f, 248.0f, 40.5f)];
//            [loginBtn setFrame:CGRectMake(36.0f, 290.0f, 248.0f, 40.5f)];
//            [registerBtn setFrame:CGRectMake(36.0f, 370.0f, 130.0f, 20.0f)];
//            [forgetBtn setFrame:CGRectMake(36.0f, 410.0f, 130.0f, 20.0f)];
//            
//            [registerImageV setFrame:CGRectMake(36.0f, 370.5f, 20.5f, 19.0f)];
//            [forgetImageV setFrame:CGRectMake(36.0f, 410.5f, 20.5f, 19.0f)];
//            
//            [accountText setFrame:CGRectMake(40.0f, 170.0f, 244.0f, 40.5f)];
//            [passwordText setFrame:CGRectMake(40.0f, 230.0f, 244.0f, 40.5f)];
        }
        
        
        
    }else {
        backgroundImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"registerBg_480"]];
        
        [backgroundImageV setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 363.0f)];
        
        [accountImageV setFrame:CGRectMake(36.0f, 142.0f, 248.0f, 40.5f)];
        [verityImageV setFrame:CGRectMake(36.0f, 202.0f, 164.5f, 40.5f)];
        [passwordImageV setFrame:CGRectMake(36.0f, 262.0f, 244.0f, 40.5f)];
        [confirmImageV setFrame:CGRectMake(36.0f, 322.0f, 244.0f, 40.5f)];
        
        [accountText setFrame:CGRectMake(40.0f, 142.0f, 244.0f, 40.5f)];
        [verityText setFrame:CGRectMake(40.0f, 202.0f, 160.5f, 40.5f)];
        [passwordText setFrame:CGRectMake(40.0f, 262.0f, 244.0f, 40.5f)];
        [confirmText setFrame:CGRectMake(40.0f, 322.0f, 244.0f, 40.5f)];
        
        [verityBtn setFrame:CGRectMake(202.5f, 202.0f, 81.5f, 40.5f)];
        [registerBtn setFrame:CGRectMake(36.0f, 382.0f, 244.0f, 40.5f)];
        
        [loginBtn setFrame:CGRectMake(36.0f, 440.0f, 204.0f, 19.0f)];
        [loginIcon setFrame:CGRectMake(36.0f, 440.0f, 20.5f, 19.0f)];
        
        if (!IS_IOS7) {
            [accountImageV setFrame:CGRectMake(36.0f, 122.0f, 248.0f, 40.5f)];
            [verityImageV setFrame:CGRectMake(36.0f, 182.0f, 164.5f, 40.5f)];
            [passwordImageV setFrame:CGRectMake(36.0f, 242.0f, 244.0f, 40.5f)];
            [confirmImageV setFrame:CGRectMake(36.0f, 302.0f, 244.0f, 40.5f)];
            
            [accountText setFrame:CGRectMake(40.0f, 122.0f, 244.0f, 40.5f)];
            [verityText setFrame:CGRectMake(40.0f, 182.0f, 160.5f, 40.5f)];
            [passwordText setFrame:CGRectMake(40.0f, 242.0f, 244.0f, 40.5f)];
            [confirmText setFrame:CGRectMake(40.0f, 302.0f, 244.0f, 40.5f)];
            
            [verityBtn setFrame:CGRectMake(202.5f, 182.0f, 81.5f, 40.5f)];
            [registerBtn setFrame:CGRectMake(36.0f, 362.0f, 244.0f, 40.5f)];
            
            [loginBtn setFrame:CGRectMake(36.0f, 420.0f, 204.0f, 19.0f)];
            [loginIcon setFrame:CGRectMake(36.0f, 420.0f, 20.5f, 19.0f)];
        }
        
    }
    
    /*!
     *  add UI
     *
     *  @since v1.0
     */
    
    [self.view addSubview:backgroundImageV];
    
    [self.view addSubview:accountImageV];
    [self.view addSubview:verityImageV];
    [self.view addSubview:passwordImageV];
    [self.view addSubview:confirmImageV];
    
    [self.view addSubview:accountText];
    [self.view addSubview:verityText];
    [self.view addSubview:passwordText];
    [self.view addSubview:confirmText];
    
    [self.view addSubview:loginIcon];
    
    [self.view addSubview:verityBtn];
    [self.view addSubview:registerBtn];
    [self.view addSubview:loginBtn];
    
}

#pragma mark - button action

- (void)verityBtnPressed:(id)sender {
    
}

- (void)loginBtnPressed:(id)sender {
    RKLoginViewController *lvCtr =[[RKLoginViewController alloc]init];
    [self.navigationController pushViewController:lvCtr animated:YES];
}

- (void)registerBtnPressed:(id)sender {
    
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
