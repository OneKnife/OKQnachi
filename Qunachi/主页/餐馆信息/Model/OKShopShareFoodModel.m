//
//  OKShopShareFoodModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopShareFoodModel.h"
#import "OKShopShareFoodCommentModel.h"

@implementation OKShopShareFoodModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:_dict];
    _Comment=[[NSMutableArray alloc] init];
    for (NSDictionary * commDict in _dict[@"Comment"]) {
        OKShopShareFoodCommentModel * model =[[OKShopShareFoodCommentModel alloc] init];
        model.dict=commDict;
        [_Comment addObject:model];
    }
    
    
//计算cell高度
    CGSize descSize =[self.Desc boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-16, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size;
    self.descHeight=descSize.height;
    self.cellHeight=278+descSize.height+10;
    
    
}

@end
