//
//  OKNearListModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKNearListModel : NSObject

@property (nonatomic,strong) NSNumber * ShopId;
@property (nonatomic,copy) NSString * ShopName;
@property (nonatomic,copy) NSString * Address;
/**美食*/
@property (nonatomic,strong) NSNumber * PaiCount;
/**推荐*/
@property (nonatomic,strong) NSNumber * RecommCount;
/**推荐图标 0不显示*/
@property (nonatomic,assign) NSInteger VipRecommCount;
@property (nonatomic,assign) CGFloat AttrTasteRate;
@property (nonatomic,copy) NSString * Lat;
@property (nonatomic,copy) NSString * lng;
@property (nonatomic,copy) NSString * CoverUrl;
@property (nonatomic,assign) NSInteger Distance;

@end
