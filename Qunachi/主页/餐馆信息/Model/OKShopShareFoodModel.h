//
//  OKShopShareFoodModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKShopShareFoodModel : NSObject

//ShareId : 165617
//Title : "烤全羊"
//Image : "http://pai1.hoto.cn/share/f1/86/165617_580.jpg"
//Desc : "羊肉很嫩。儿子吃的蛮开心呀。"
//ShopId : 23553660
//ShopName : "九十九顶毡房"
//Address : "东升乡马坊村永泰庄北路9号"
//Lng : "116.37440490722656000000"
//Lat : "40.04639434814453000000"
//Phone
//CommentCount : 3
//Comment
//FeelType : 3
//UserId : 1133441
//UserName : "wthorse"
//AvatarUrl : "http://head1.hoto.cn/81/4b/1133441_70.jpg?v=3"
//VipType : 0
//VipLevel : 0
//VipIcoUrl : ""
//CreateTime : "2012-12-01 15:42:43"
//LikeCount : 0
//IsLike : false
//SameNameShare : 1
@property (nonatomic,strong) NSNumber * ShareId;
@property (nonatomic,copy) NSString * Title;
@property (nonatomic,copy) NSString * Image;
@property (nonatomic,copy) NSString * Desc;
@property (nonatomic,strong) NSNumber * ShopId;
@property (nonatomic,copy) NSString * ShopName;
@property (nonatomic,copy) NSString * Address;
@property (nonatomic,copy) NSString * Lng;
@property (nonatomic,copy) NSString * Lat;
@property (nonatomic,strong) NSMutableArray * Phone;
@property (nonatomic,strong) NSNumber * CommentCount;
@property (nonatomic,strong) NSMutableArray * Comment;
@property (nonatomic,strong) NSNumber * FeelType;
@property (nonatomic,strong) NSNumber * UserId;
@property (nonatomic,copy) NSString * UserName;
@property (nonatomic,copy) NSString * AvatarUrl;
@property (nonatomic,copy) NSString * CreateTime;
@property (nonatomic,assign) CGFloat descHeight;
@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic,strong) NSDictionary * dict;

@end
