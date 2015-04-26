//
//  OKShopInfoCommentModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKShopInfoCommentModel : NSObject

@property (nonatomic,assign) NSInteger Id;
@property (nonatomic,assign) NSInteger UserId;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,copy) NSString * Comment;
@property (nonatomic,copy) NSString * DateStr;

@property (nonatomic,strong) NSDictionary * dict;

@end
