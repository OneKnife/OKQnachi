//
//  OKHomeDetailCell.h
//  Qunachi
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKHomeDetailModel.h"

@protocol OKHomeDetailModelDelegate <NSObject>

-(void)jumpShopInfoControllerWithshopId:(NSNumber *)shopId;

@end

@interface OKHomeDetailCell : UITableViewCell

@property (nonatomic,strong) OKHomeDetailModel * model;

@property (nonatomic,weak) id delegate;

@end
