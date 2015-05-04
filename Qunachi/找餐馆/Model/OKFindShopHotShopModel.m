//
//  OKFindShopHotShopModel.m
//  Qunachi
//
//  Created by qianfeng on 15-5-4.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFindShopHotShopModel.h"

@implementation OKFindShopHotShopModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:dict];
}


@end
