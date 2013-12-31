//
//  Constents.h
//  LohasPlatform
//
//  Created by Evan on 13-12-11.
//  Copyright (c) 2013年 Evan. All rights reserved.
//


//Server Address
#define SERVER_URL @"http://xintuo.rikee.net/xingtuo/index.php?s="
#define SERVERURL @"xintuo.rikee.net"

//Url Address
#define homeUrl [NSString stringWithFormat:@"%@/ApiIndex/index", SERVER_URL]
#define loginUrl [NSString stringWithFormat:@"%@/ApiLogin/login", SERVER_URL]
#define verifyUrl [NSString stringWithFormat:@"%@/ApiSend/register_send", SERVER_URL]
#define registerUrl [NSString stringWithFormat:@"%@/ApiLogin/register", SERVER_URL]
#define faqUrl [NSString stringWithFormat:@"%@/ApiQuestion/add_question", SERVER_URL]
#define msgUrl [NSString stringWithFormat:@"%@/ApiMessage/message_list", SERVER_URL]
#define newsUrl [NSString stringWithFormat:@"%@/ApiNews/news_list", SERVER_URL]
#define newsDetailUrl [NSString stringWithFormat:@"%@/ApiNews/news_one", SERVER_URL]
#define questionUrl [NSString stringWithFormat:@"%@/ApiQuestion/add_question", SERVER_URL]
#define productsUrl [NSString stringWithFormat:@"%@/ApiProduct/product_list", SERVER_URL]
#define adUrl [NSString stringWithFormat:@"%@/ApiAdvertisement/index", SERVER_URL]
#define peopleUrl [NSString stringWithFormat:@"%@/ApiRelation/get_director_from_user/", SERVER_URL]
#define people2Url [NSString stringWithFormat:@"%@/ApiRelation/get_user_from_director/", SERVER_URL]
#define productLogUrl [NSString stringWithFormat:@"%@/ApiBrowseLog/record_log", SERVER_URL]
