//
//  RKUserViewController.m
//  LohasPlatform
//
//  Created by Evan on 13-12-17.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKUserViewController.h"

@interface RKUserViewController ()

@end

@implementation RKUserViewController

@synthesize userBg, topBg, userImageV, nameLabel, moneyImageV, marksImageV, tableView, moneyBtn, marksBtn, dataArray;

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
    
    
    self.view.backgroundColor =[UIColor whiteColor];
    dataArray =[[NSArray alloc]init];
    dataArray =@[@{@"title": @"乐活大米订单x2",@"image": @"pp1",@"time": @"昨天10:30",@"result": @"+ 400",@"type": @"1"},@{@"title": @"乐活大米流量积分",@"image": @"pp1",@"time": @"昨天 273 次访问",@"result": @"+ 273",@"type": @"2"},@{@"title": @"MERLOT红酒流量积分",@"image": @"pp2",@"time": @"昨天 172 次访问",@"result": @"+ 172",@"type": @"2"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x1",@"image": @"pp3",@"time": @"昨天12:12",@"result": @"+ 120.00",@"type": @"1"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x3",@"image": @"pp3",@"time": @"昨天21:16",@"result": @"+ 360.00",@"type": @"1"},@{@"title": @"乐活大米订单x2",@"image": @"pp1",@"time": @"昨天10:30",@"result": @"+ 400",@"type": @"1"},@{@"title": @"乐活大米流量积分",@"image": @"pp1",@"time": @"昨天 273 次访问",@"result": @"+ 273",@"type": @"2"},@{@"title": @"MERLOT红酒流量积分",@"image": @"pp2",@"time": @"昨天 172 次访问",@"result": @"+ 172",@"type": @"2"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x1",@"image": @"pp3",@"time": @"昨天12:12",@"result": @"+ 120.00",@"type": @"1"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x3",@"image": @"pp3",@"time": @"昨天21:16",@"result": @"+ 360.00",@"type": @"1"},@{@"title": @"乐活大米订单x2",@"image": @"pp1",@"time": @"昨天10:30",@"result": @"+ 400",@"type": @"1"},@{@"title": @"乐活大米流量积分",@"image": @"pp1",@"time": @"昨天 273 次访问",@"result": @"+ 273",@"type": @"2"},@{@"title": @"MERLOT红酒流量积分",@"image": @"pp2",@"time": @"昨天 172 次访问",@"result": @"+ 172",@"type": @"2"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x1",@"image": @"pp3",@"time": @"昨天12:12",@"result": @"+ 120.00",@"type": @"1"},@{@"title": @"汤臣倍健蜂王浆软胶囊订单 x3",@"image": @"pp3",@"time": @"昨天21:16",@"result": @"+ 360.00",@"type": @"1"}];
}

- (void)viewWillAppear:(BOOL)animated {
    [self setUI];
}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceieMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)setUI {
    
    /*!
     *  set up tableView
     *
     *  @since v1.0
     */
    tableView =[[UITableView alloc]init];
    tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor =[UIColor clearColor];
    tableView.delegate =self;
    tableView.dataSource =self;
    
    /*!
     *  set up image
     *
     *  @since v1.0
     */
    userBg =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userBg"]];
    topBg =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"topBg"]];
    userImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"userIcon"]];
    moneyImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"money"]];
    marksImageV =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"marks"]];
    
    nameLabel =[[UILabel alloc]init];
    nameLabel.text =@"乐活族200298";
    [nameLabel setFont:[UIFont systemFontOfSize:20.0f]];
    nameLabel.textColor =[UIColor whiteColor];
    nameLabel.textAlignment =UITextAlignmentCenter;
    
    moneyBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    marksBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    [moneyBtn setImage:[UIImage imageNamed:@"moneyBtnBg"] forState:UIControlStateNormal];
    [marksBtn setImage:[UIImage imageNamed:@"marksBtnBg"] forState:UIControlStateNormal];
    
    
    [userBg setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 303.5f)];
    [topBg setFrame:CGRectMake(0.0f, 20.0f, 320.0f, 30.0f)];
    [userImageV setFrame:CGRectMake(110.0f, 80.0f, 100.0f, 100.0f)];
    [nameLabel setFrame:CGRectMake(0.0f, 200.0f, 320.0f, 20.0f)];
    [moneyImageV setFrame:CGRectMake(0.0f, 254.0f, 110.0f, 49.5f)];
    [moneyBtn setFrame:CGRectMake(110.0f, 254.0f, 50.5f, 49.5f)];
    [marksImageV setFrame:CGRectMake(160.0f, 254.0f, 110.0f, 49.5f)];
    [marksBtn setFrame:CGRectMake(270.0f, 254.0f, 50.5f, 49.5f)];
    
#warning test
    if (0) {
        
    } else {
        [tableView setFrame:CGRectMake(0.0f, 303.5f, 320.0f, 176.5f)];
        if (!IS_IOS7) {
            [userBg setFrame:CGRectMake(0.0f, -20.0f, 320.0f, 303.5f)];
            [topBg setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 30.0f)];
            [userImageV setFrame:CGRectMake(110.0f, 60.0f, 100.0f, 100.0f)];
            [nameLabel setFrame:CGRectMake(0.0f, 180.0f, 320.0f, 20.0f)];
            [moneyImageV setFrame:CGRectMake(0.0f, 234.0f, 110.0f, 49.5f)];
            [moneyBtn setFrame:CGRectMake(110.0f, 234.0f, 50.5f, 49.5f)];
            [marksImageV setFrame:CGRectMake(160.0f, 234.0f, 110.0f, 49.5f)];
            [marksBtn setFrame:CGRectMake(270.0f, 234.0f, 50.5f, 49.5f)];
            [tableView setFrame:CGRectMake(0.0f, 283.5f, 320.0f, 176.5f)];
        }
    }
    
    [self.view addSubview:userBg];
    [self.view addSubview:topBg];
    [self.view addSubview:userImageV];
    [self.view addSubview:nameLabel];
    [self.view addSubview:moneyImageV];
    [self.view addSubview:moneyBtn];
    [self.view addSubview:marksImageV];
    [self.view addSubview:marksBtn];
    [self.view addSubview:tableView];
    
    [tableView reloadData];
}

#pragma mark - table view delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *cellDict =[dataArray objectAtIndex:indexPath.row];
    static NSString *CellIdentifier = @"Cell";
    
    
    RKMarksTableCell *cell = (RKMarksTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RKMarksTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.backgroundColor =[UIColor clearColor];
    
    cell.iconImageV.image =[UIImage imageNamed:[cellDict objectForKey:@"image"]];
    cell.titleLabel.text =[cellDict objectForKey:@"title"];
    cell.timeLabel.text =[cellDict objectForKey:@"time"];
    cell.resultLabel.text =[cellDict objectForKey:@"result"];
    
    if ([[cellDict objectForKey:@"type"] isEqualToString:@"1"]) {
        cell.resultLabel.textColor =[UIColor redColor];
    } else {
        cell.resultLabel.textColor =[UIColor blueColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.highlighted =NO;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 42.5f;
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
