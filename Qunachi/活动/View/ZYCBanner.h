//
//  ZYCBanner.h
//  StarWardrobe
//
//  Created by qianfeng on 15-4-14.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKActivityBannerModel.h"

@protocol ZYCBannerDelegate <NSObject>

-(void)bannerOnclickWithUrl:(NSString * )url;

@end

@interface ZYCBanner : UIView

@property (nonatomic,strong) NSMutableArray * modelArray;
@property (nonatomic,weak) id delegate;


@end
