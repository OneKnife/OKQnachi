//
//  OKFriendModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKFriendModel : NSObject

@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,strong) NSNumber * FollowCount;
@property (nonatomic,strong) NSNumber * FansCount;
@property (nonatomic,copy) NSString * ExpName;
@property (nonatomic,strong) NSNumber * Gender;
@property (nonatomic,copy) NSString * Province;
@property (nonatomic,copy) NSString * City;
@property (nonatomic,strong) NSNumber * Wealth;
@end
