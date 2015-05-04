//
//  OKNearFriendModel.m
//  Qunachi
//
//  Created by qianfeng on 15-5-3.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNearFriendModel.h"

@implementation OKNearFriendModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    
    [self setValuesForKeysWithDictionary:_dict];
    
    self.LastAct=[[OKNearFriendLastActModel alloc]init];
    self.LastAct.dict=_dict[@"LastAct"];
}

@end
