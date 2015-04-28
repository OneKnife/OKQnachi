//
//  OKYuefanListModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKYuefanListModel : NSObject

@property (nonatomic,assign) NSInteger UserId;
@property (nonatomic,assign) NSInteger Age;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,assign) NSInteger VipType;
@property (nonatomic,copy) NSString * VipIcoUrl;

/**
 性别
 0.女1.男
 */
@property (nonatomic,copy) NSString * UserGender;
@property (nonatomic,assign) NSInteger DatingId;
@property (nonatomic,copy) NSString * Title;
/**
 谁请客
 1.我请客
 2.AA
 3.你
 */
@property (nonatomic,strong) NSNumber * CostType;
@property (nonatomic,copy) NSString * StartTime;
@property (nonatomic,copy) NSString * ShopName;
@property (nonatomic,copy) NSString * Address;
/**报名人数*/
@property (nonatomic,strong) NSNumber * ApplyCount;
/**浏览人数*/
@property (nonatomic,strong) NSNumber * ViewCount;

/**评论人数*/
@property (nonatomic,strong) NSNumber * CommentCount;
@property (nonatomic,copy) NSString * CityName;

/**
 0.只约女生
 1.只约男生
 2.男女不限
 */
@property (nonatomic,strong) NSNumber * Invited;
@property (nonatomic,copy) NSString * Distance;

@end
