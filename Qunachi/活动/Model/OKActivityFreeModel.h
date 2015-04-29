//
//  OKActivityFreeModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKActivityFreeModel : NSObject

@property (nonatomic,copy) NSString * Id;
@property (nonatomic,copy) NSString * Title;// : "金银满盆，新年百万"
@property (nonatomic,copy) NSString * Time;// : "2015-02-11 18:30:00"
@property (nonatomic,copy) NSString * Summary;// : "小年齐聚金百万，为你精心打造一场高品质的烤鸭年夜饭！"
@property (nonatomic,strong) NSNumber * Status;
@property (nonatomic,strong) NSNumber * UserCount;// : 15
@property (nonatomic,strong) NSNumber * ApplyUserCount;// : 843
@property (nonatomic,copy) NSString * Image;// : "http://img1.hoto.cn/haodou/app/qunachi/party/201501/189_175.jpg"
@property (nonatomic,strong) NSNumber * ShopId;// : 23710725
@property (nonatomic,copy) NSString * ShopName;// : "金百万烤鸭店(乐家店)"

@property (nonatomic,strong) NSDictionary * dict;

@end
