//
//  OKActivityFreeDetailModel.h
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKActivityFreeDetailModel : NSObject


@property (nonatomic,copy) NSString * Id;// : "189"
@property (nonatomic,copy) NSString * Cid;// : "2"
@property (nonatomic,strong) NSNumber * ShopId;// : 23710725
@property (nonatomic,copy) NSString * ShowStartTime;// : "2015-01-28 00:00:00"
@property (nonatomic,copy) NSString * ShowEndTime;// : "2016-01-29 17:56:04"
@property (nonatomic,copy) NSString * PartyTime;// : "2015-02-11 18:30:00"
@property (nonatomic,copy) NSString * UserNum;// : "15"
@property (nonatomic,copy) NSString * Title;// : "金银满盆，新年百万"
@property (nonatomic,copy) NSString * Summary;// : "小年齐聚金百万，为你精心打造一场高品质的烤鸭年夜饭！"
@property (nonatomic,strong) NSMutableArray * Detail;//
@property (nonatomic,copy) NSString * CreateTime;// : "2015-01-27 17:59:07"
@property (nonatomic,strong) NSNumber * Status;// : 4
@property (nonatomic,copy) NSString * ApplyStartTime;// : "2015-01-27 17:55:34"
@property (nonatomic,copy) NSString * ApplyEndTime;// : "2015-02-10 12:00:00"
@property (nonatomic,copy) NSString * ApplyUserNum;// : "843"
@property (nonatomic,strong) NSNumber * LastDays;// : 0
@property (nonatomic,copy) NSString * Image;// : "http://img1.hoto.cn/haodou/app/qunachi/party/201501/189.jpg"
@property (nonatomic,assign) BOOL IsApply;// : false


@property (nonatomic,strong) NSNumber * summaryHeight;

@property (nonatomic,strong) NSMutableArray * detailHeightArray;


@property (nonatomic,strong) NSDictionary * dict;

@end
