//
//  OKActivityCarefullyChosenModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKActivityCarefullyChosenModel : NSObject


@property (nonatomic,copy) NSString * Id;
@property (nonatomic,copy) NSString * Type;
@property (nonatomic,copy) NSString * Title;
@property (nonatomic,copy) NSString * Image;
@property (nonatomic,copy) NSString * CateCount;
@property (nonatomic,copy) NSString * Url;

@property (nonatomic,strong) NSDictionary * dict;

@end
