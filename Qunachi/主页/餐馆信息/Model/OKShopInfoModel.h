//
//  OKShopInfoModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OKShopInfoCommentModel.h"
#import "OKShopInfoTopicModel.h"
@interface OKShopInfoModel : NSObject


@property (nonatomic,strong) NSNumber * ShopId;
@property (nonatomic,copy) NSString * ShopName;
@property (nonatomic,copy) NSString * Cover;
@property (nonatomic,assign) NSInteger AreaId;
@property (nonatomic,copy) NSString * AreaName;
@property (nonatomic,strong) NSMutableArray * Images;
@property (nonatomic,assign) NSInteger CityId;
@property (nonatomic,copy) NSString * CityName;
@property (nonatomic,copy) NSString * Address;
@property (nonatomic,assign) NSInteger Status;
@property (nonatomic,copy) NSString * Lng;
@property (nonatomic,copy) NSString * Lat;
@property (nonatomic,strong) NSMutableArray * Phone;
@property (nonatomic,strong) NSMutableArray * Tags;
@property (nonatomic,assign) CGFloat TasteRate;
@property (nonatomic,assign) NSInteger RecommendCount;
@property (nonatomic,assign) NSInteger FavoriteCount;
@property (nonatomic,copy) NSString * RecommendVipName;
@property (nonatomic,strong) NSMutableArray * Tips;
@property (nonatomic,assign) NSInteger LastActId;
@property (nonatomic,strong) OKShopInfoCommentModel * Comment;
@property (nonatomic,assign) NSInteger TopicCount;
@property (nonatomic,strong) OKShopInfoTopicModel * Topic;
@property (nonatomic,assign) NSInteger ShareCount;
@property (nonatomic,strong) NSMutableArray * ShareList;

@property (nonatomic,strong) NSDictionary * dict;

@end
