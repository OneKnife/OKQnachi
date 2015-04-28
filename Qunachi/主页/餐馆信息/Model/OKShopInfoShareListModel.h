//
//  OKShopInfoShareListModel.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKShopInfoShareListModel : NSObject


@property (nonatomic,strong) NSNumber * ShareId;
@property (nonatomic,copy) NSString * Title;
@property (nonatomic,assign) NSInteger FeelType;
@property (nonatomic,copy) NSString * Image;

@property (nonatomic,strong) NSDictionary * dict;


@end
