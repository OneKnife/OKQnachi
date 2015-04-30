//
//  OKHomeDetailModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKHomeDetailModel : NSObject

@property (nonatomic,strong) NSNumber * DatingId;// : 897
@property (nonatomic,strong) NSNumber *  UserId;// : 7427815
@property (nonatomic,copy) NSString * Title;// : "呵呵呵"
@property (nonatomic,strong) NSNumber * CostType;// : 3
@property (nonatomic,copy) NSString * StartTime;// : "2015-05-14 18:00:00"
@property (nonatomic,strong) NSNumber * ShopId;// : 23286312
@property (nonatomic,copy) NSString * ShopName;// : "麦当劳"
@property (nonatomic,copy) NSString * Address;// : "临汾市尧都区解放路世纪百悦购物中心"
@property (nonatomic,strong) NSNumber * ApplyCount;// : 5
@property (nonatomic,strong) NSNumber * ViewCount;// : 239
@property (nonatomic,strong) NSNumber * CommentCount;// : 1

@property (nonatomic,copy) NSString * CityName;// : "临汾"
@property (nonatomic,strong) NSNumber * ShowStatus;// : 1
@property (nonatomic,strong) NSNumber * Invited;//; : 2
@property (nonatomic,strong) NSNumber * Age;// : 13
@property (nonatomic,copy) NSString * UserName;// : "你伤不起劳资的心"
@property (nonatomic,copy) NSString * AvatarUrl;// : "http://head1.hoto.cn/e7/56/7427815_70.jpg?v=1"
@property (nonatomic,strong) NSNumber * UserGender;
@property (nonatomic,strong) NSNumber * LoginUserGender;// : 1
@property (nonatomic,strong) NSMutableArray * Comment;

@property (nonatomic,strong) NSDictionary * dict;
@end
