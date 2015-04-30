//
//  OKHomeDetailModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeDetailModel.h"
#import "OKHomeDetailCommentModel.h"
@implementation OKHomeDetailModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    
    [self setValuesForKeysWithDictionary:_dict];
    self.Comment=[[NSMutableArray alloc]init];
    for (NSDictionary * itemDict in _dict[@"Comment"]) {
        OKHomeDetailCommentModel * model=[[OKHomeDetailCommentModel alloc] init];
        model.dict=itemDict;
        [self.Comment addObject:model];
    }
    
}

@end
