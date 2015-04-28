//
//  OKShopInfoModel.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoModel.h"
#import "OKShopInfoImagesModel.h"
#import "OKShopInfoTagsModel.h"
#import "OKShopInfoCommentModel.h"
#import "OKShopInfoTopicModel.h"
#import "OKShopInfoShareListModel.h"
@implementation OKShopInfoModel


-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(void)setDict:(NSDictionary *)dict
{
    _dict=dict;
    
    [self setValuesForKeysWithDictionary:dict];
    
    self.Images =[[NSMutableArray alloc] init];
    for (NSDictionary * image in dict[@"Images"]) {
        OKShopInfoImagesModel * model = [[OKShopInfoImagesModel alloc] init];
        model.dict=image;
        [self.Images addObject:model];
    }
    
    self.Tags=[[NSMutableArray alloc] init];
    for (NSDictionary * tag in dict[@"Tags"]) {
        OKShopInfoTagsModel * model = [[OKShopInfoTagsModel alloc] init];
        model.dict=tag;
        [self.Tags addObject:model];
    }
    
    self.Comment=[[OKShopInfoCommentModel alloc] init];
    self.Comment.dict=dict[@"Comment"];
    self.Topic = [[OKShopInfoTopicModel alloc] init];
    self.Topic.dict=dict[@"Topic"];
    
    self.ShareList =[[NSMutableArray alloc] init];
    for (NSDictionary * shareList in dict[@"ShareList"]) {
        OKShopInfoShareListModel * model = [[OKShopInfoShareListModel alloc] init];
        model.dict = shareList;
        [self.ShareList addObject:model];
    }
    
    
}






@end
