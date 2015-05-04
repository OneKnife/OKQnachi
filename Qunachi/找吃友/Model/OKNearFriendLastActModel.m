//
//  OKNearFriendLastActModel.m
//  Qunachi
//
//  Created by qianfeng on 15-5-3.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNearFriendLastActModel.h"

@implementation OKNearFriendLastActModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:dict];
    
}

@end
