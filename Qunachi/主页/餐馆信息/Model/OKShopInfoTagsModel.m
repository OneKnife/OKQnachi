//
//  OKShopInfoTagsModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoTagsModel.h"

@implementation OKShopInfoTagsModel

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
