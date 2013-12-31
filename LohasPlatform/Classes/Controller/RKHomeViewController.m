//
//  RKHomeViewController.m
//  LohasPlatform
//
//  Created by Evan on 13-12-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKHomeViewController.h"

@interface RKHomeViewController ()

@end

@implementation RKHomeViewController

@synthesize imageSV, loginBtn, registerBtn, pageCtr;

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
    // Do any additional setup after loading the view from its nib.
}


-(void)viewWillAppear:(BOOL)animated {
    [self setUI];
    
    
//#warning test
//    [self loginBtnPressed:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Setting

- (void)setUI {
    /*!
     *  set button
     *
     *  @since v1.0
     */

    loginBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (IS_IOS7) {
        [loginBtn setFrame:CGRectMake(160.0f, SCREEN_HEIGHT -59.5f, 160.0f, 59.5f)];
        [registerBtn setFrame:CGRectMake(0.0f, SCREEN_HEIGHT -59.5f, 160.0f, 59.5f)];
    } else {
        [loginBtn setFrame:CGRectMake(160.0f, SCREEN_HEIGHT -79.5f, 160.0f, 59.5f)];
        [registerBtn setFrame:CGRectMake(0.0f, SCREEN_HEIGHT -79.5f, 160.0f, 59.5f)];
    }
    
    [loginBtn setImage:[UIImage imageNamed:@"loginBtn"] forState:UIControlStateNormal];
    [registerBtn setImage:[UIImage imageNamed:@"registerBtn"] forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(loginBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn addTarget:self action:@selector(registerBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    /*!
     *  set scrollView
     *
     *  @since v1.0
     */
    if (IS_IPHONE_5) {
        
        UIImage *welcomeImg1 =[UIImage imageNamed:@"welcome1"];
        UIImage *welcomeImg2 =[UIImage imageNamed:@"welcome2"];
        UIImage *welcomeImg3 =[UIImage imageNamed:@"welcome3"];
        UIImage *welcomeImg4 =[UIImage imageNamed:@"welcome4"];
        UIImage *welcomeImg5 =[UIImage imageNamed:@"welcome5"];
        
        UIImageView *welcomeImageV1 =[[UIImageView alloc]initWithImage:welcomeImg1];
        UIImageView *welcomeImageV2 =[[UIImageView alloc]initWithImage:welcomeImg2];
        UIImageView *welcomeImageV3 =[[UIImageView alloc]initWithImage:welcomeImg3];
        UIImageView *welcomeImageV4 =[[UIImageView alloc]initWithImage:welcomeImg4];
        UIImageView *welcomeImageV5 =[[UIImageView alloc]initWithImage:welcomeImg5];
        
        [welcomeImageV1 setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 508.5f)];
        [welcomeImageV2 setFrame:CGRectMake(320.0f, 0.0f, 320.0f, 508.5f)];
        [welcomeImageV3 setFrame:CGRectMake(640.0f, 0.0f, 320.0f, 508.5f)];
        [welcomeImageV4 setFrame:CGRectMake(960.0f, 0.0f, 320.0f, 508.5f)];
        [welcomeImageV5 setFrame:CGRectMake(1280.0f, 0.0f, 320.0f, 508.5f)];
        
        imageSV =[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 508.5f)];
        imageSV.delegate =self;
        
        [imageSV addSubview:welcomeImageV1];
        [imageSV addSubview:welcomeImageV2];
        [imageSV addSubview:welcomeImageV3];
        [imageSV addSubview:welcomeImageV4];
        [imageSV addSubview:welcomeImageV5];

        [imageSV setContentSize:CGSizeMake(1600.0f, 508.5f)];
        imageSV.pagingEnabled                  = YES;
        imageSV.showsHorizontalScrollIndicator = NO;
        imageSV.showsVerticalScrollIndicator   = NO;
        imageSV.bounces                        = NO;
        
        
        
        
    } else {
        /*!
         *  set scrollview with ip4
         *
         *  @since v1.0
         */
        UIImage *welcomeImg1 =[UIImage imageNamed:@"welcome1_480"];
        UIImage *welcomeImg2 =[UIImage imageNamed:@"welcome2_480"];
        UIImage *welcomeImg3 =[UIImage imageNamed:@"welcome3_480"];
        UIImage *welcomeImg4 =[UIImage imageNamed:@"welcome4_480"];
        UIImage *welcomeImg5 =[UIImage imageNamed:@"welcome5_480"];

        UIImageView *welcomeImageV1 =[[UIImageView alloc]initWithImage:welcomeImg1];
        UIImageView *welcomeImageV2 =[[UIImageView alloc]initWithImage:welcomeImg2];
        UIImageView *welcomeImageV3 =[[UIImageView alloc]initWithImage:welcomeImg3];
        UIImageView *welcomeImageV4 =[[UIImageView alloc]initWithImage:welcomeImg4];
        UIImageView *welcomeImageV5 =[[UIImageView alloc]initWithImage:welcomeImg5];

        [welcomeImageV1 setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
        [welcomeImageV2 setFrame:CGRectMake(320.0f, 0.0f, 320.0f, 480.0f)];
        [welcomeImageV3 setFrame:CGRectMake(640.0f, 0.0f, 320.0f, 480.0f)];
        [welcomeImageV4 setFrame:CGRectMake(960.0f, 0.0f, 320.0f, 480.0f)];
        [welcomeImageV5 setFrame:CGRectMake(1280.0f, 0.0f, 320.0f, 480.0f)];

        imageSV =[[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
        imageSV.delegate =self;

        [imageSV addSubview:welcomeImageV1];
        [imageSV addSubview:welcomeImageV2];
        [imageSV addSubview:welcomeImageV3];
        [imageSV addSubview:welcomeImageV4];
        [imageSV addSubview:welcomeImageV5];

        [imageSV setContentSize:CGSizeMake(1600.0f, 480.0f)];
        imageSV.pagingEnabled                  = YES;
        imageSV.showsHorizontalScrollIndicator = NO;
        imageSV.showsVerticalScrollIndicator   = NO;
        imageSV.bounces                        = NO;

    }
    
    
    /*!
     *  add pagecontroller
     *
     *  @since v1.0
     */
    if (IS_IOS7) {
        pageCtr =[[UIPageControl alloc]initWithFrame:CGRectMake(160.0f, SCREEN_HEIGHT -70.0f, 0.0f, 0.0f)];
    } else {
        pageCtr =[[UIPageControl alloc]initWithFrame:CGRectMake(160.0f, SCREEN_HEIGHT -120.0f, 0.0f, 0.0f)];
    }
    [pageCtr setNumberOfPages:5];
    pageCtr.currentPage =0;
    
    
    /*!
     *  add subView
     *
     *  @since v1.0
     */
    [self.view addSubview:imageSV];
    [self.view addSubview:loginBtn];
    [self.view addSubview:registerBtn];
    [self.view addSubview:pageCtr];
    
    
}


#pragma mark - button action
/*!
 *  register button action
 *
 *  @param void null
 *
 *  @return null
 *
 *  @since v1.0
 */

- (void)registerBtnPressed:(id)sender {
    RKRegisterViewController *rvCtr =[[RKRegisterViewController alloc]init];
    [self.navigationController pushViewController:rvCtr animated:YES];
}

/*!
 *  login button action
 *
 *  @param void null
 *
 *  @return null
 *
 *  @since v1.0
 */

- (void)loginBtnPressed:(id)sender {
    RKLoginViewController *lvCtr =[[RKLoginViewController alloc]init];
    [self.navigationController pushViewController:lvCtr animated:YES];
}

#pragma mark - Delegate
/*!
 *  scroll delegate
 *
 *  @since v1.0
 */

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = fabs(scrollView.contentOffset.x/320);
    if(page != pageCtr.currentPage)
    {
        [pageCtr setCurrentPage:page];
    }
}

@end
