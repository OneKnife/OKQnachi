//
//  OKFindShopHotShopModel.h
//  Qunachi
//
//  Created by qianfeng on 15-5-4.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKFindShopHotShopModel : NSObject

@property (nonatomic,strong) NSNumber * ShopId;// : 23386424
@property (nonatomic,copy) NSString * ShopName;// : "爱江山(将台西路店)"
@property (nonatomic,copy) NSString * Address;// : "将台西路9-7号四得公园北门旁(珀丽饭店对面)"
@property (nonatomic,strong) NSNumber * PaiCount;// : 10
@property (nonatomic,strong) NSNumber * RecommCount;// : 3
@property (nonatomic,strong) NSNumber * VipRecommCount;// : 1
@property (nonatomic,strong) NSNumber * AttrTasteRate;// : 5
@property (nonatomic,copy) NSString * Lat;// : "39.97829818725586000000"
@property (nonatomic,copy) NSString * Lng;// : "116.48481750488281000000"
@property (nonatomic,copy) NSString * CoverUrl;// : "http://pai1.hoto.cn/shop/cf/4f/217039_185.jpg"

@property (nonatomic,strong) NSDictionary * dict;

@end
