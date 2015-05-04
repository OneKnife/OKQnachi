//
//  OKNearFriendModel.h
//  Qunachi
//
//  Created by qianfeng on 15-5-3.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OKNearFriendLastActModel.h"

@interface OKNearFriendModel : NSObject



@property (nonatomic,strong) NSNumber * UserId;// : 3075033

@property (nonatomic,strong) OKNearFriendLastActModel * LastAct;

@property (nonatomic,copy) NSString * LastActTime;// : "2014-05-06 13:41:24"
@property (nonatomic,copy) NSString * UserName;// : "heliotrope"
@property (nonatomic,copy) NSString * AvatarUrl;// : "http://head1.hoto.cn/d9/eb/3075033_70.jpg"
@property (nonatomic,copy) NSString * Distance;// : "4.4km"
@property (nonatomic,strong) NSNumber * UserGender;// : 2


@property (nonatomic,strong) NSDictionary * dict;

@end
