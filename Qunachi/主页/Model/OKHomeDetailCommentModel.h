//
//  OKHomeDetailCommentModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKHomeDetailCommentModel : NSObject
@property (nonatomic,strong) NSNumber * Id;// : 24835794
@property (nonatomic,strong) NSNumber * UserId;// : 7099791
@property (nonatomic,copy) NSString * UserName;// : "阿哲同学"
@property (nonatomic,copy) NSString * AvatarUrl;// : "http://head1.hoto.cn/8f/55/7099791_70.jpg?v=1"
@property (nonatomic,copy) NSString * Comment;// : "我点错了，不去了，5月多我不在"
@property (nonatomic,copy) NSString * DateStr;// : "2015-04-19 16:47:39"

@property (nonatomic,strong) NSDictionary * dict;
@end
