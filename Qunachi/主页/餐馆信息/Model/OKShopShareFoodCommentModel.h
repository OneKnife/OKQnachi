//
//  OKShopShareFoodCommentModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKShopShareFoodCommentModel : NSObject
//Id : 8144744
//UserId : 476123
//UserName : "赵涵妈"
//AvatarUrl : "http://head1.hoto.cn/db/43/476123_70.jpg?v=3"
//VipType : 0
//VipLevel : 0
//VipIcoUrl : ""
//Comment : "好喜欢吃烤的呢，好诱人呀"
//AtUserId : 0
//AtUserName : ""
//DateStr : "2012-12-08 08:45:29"

@property (nonatomic,strong) NSNumber * Id;
@property (nonatomic,strong) NSNumber * UserId;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,copy) NSString * Comment;
@property (nonatomic,copy) NSString * DateStr;

@property (nonatomic,assign) CGFloat descHeight;
@property (nonatomic,assign) CGFloat cellHeight;


@property (nonatomic,strong) NSDictionary * dict;

@end
