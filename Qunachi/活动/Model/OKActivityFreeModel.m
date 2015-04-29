//
//  OKActivityFreeModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeModel.h"

@implementation OKActivityFreeModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    
    [self setValuesForKeysWithDictionary:_dict];
    
}

@end
