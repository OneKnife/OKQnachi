//
//  OKHomeDetailCommentModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeDetailCommentModel.h"

@implementation OKHomeDetailCommentModel


-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:_dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
