//
//  OKActivityFreeDetailModel.m
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeDetailModel.h"

@implementation OKActivityFreeDetailModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:_dict];
    
    CGSize size = [self.Summary boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    self.summaryHeight = @(size.height);
    
    _detailHeightArray=[[NSMutableArray alloc] init];
    for (NSString * detailStr in self.Detail) {
        CGFloat height = [detailStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
        [_detailHeightArray addObject:@(height)];
    }
    
}

@end
