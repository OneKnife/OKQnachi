//
//  OKShopInfoShareListModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoShareListModel.h"

@implementation OKShopInfoShareListModel

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    
    [self setValuesForKeysWithDictionary:_dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
