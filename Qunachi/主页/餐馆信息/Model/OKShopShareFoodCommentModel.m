//
//  OKShopShareFoodCommentModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopShareFoodCommentModel.h"

@implementation OKShopShareFoodCommentModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    [self setValuesForKeysWithDictionary:_dict];
    
    
    //计算cell高度
    CGSize descSize =[self.Comment boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-46-20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil].size;
    self.descHeight=descSize.height;
    self.cellHeight=50+descSize.height+10;

    
}




@end
