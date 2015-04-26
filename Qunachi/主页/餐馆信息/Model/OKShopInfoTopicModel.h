//
//  OKShopInfoTopicModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKShopInfoTopicModel : NSObject
@property (nonatomic,assign) NSInteger TopicId;
@property (nonatomic,copy) NSString * Title;
@property (nonatomic,assign) NSInteger UserId;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,assign) NSInteger VipType;
@property (nonatomic,assign) NSInteger VipLevel;
@property (nonatomic,copy) NSString * VipIcoUrl;
@property (nonatomic,assign) NSInteger ViewCount;
@property (nonatomic,copy) NSString * Image;
@property (nonatomic,copy) NSString * Content;

@property (nonatomic,strong) NSDictionary * dict;


@end
