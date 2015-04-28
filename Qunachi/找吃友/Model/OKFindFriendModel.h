//
//  OKFindFriendModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKFindFriendModel : NSObject

@property (nonatomic,copy) NSString * UserId;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
/**关注*/
@property (nonatomic,strong) NSNumber * FollowCount;
/**粉丝*/
@property (nonatomic,strong) NSNumber * FansCount;
/**美食*/
@property (nonatomic,strong) NSMutableArray * ShareCount;

@end
