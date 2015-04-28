//
//  OKShopInfoSection1Row1Cell.h
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKShopInfoModel.h"

@protocol OKShopInfoSection1Delegate <NSObject>

-(void)imageClick;

@end

@interface OKShopInfoSection1Row1Cell : UITableViewCell

@property(nonatomic,strong) OKShopInfoModel * model;
@property (nonatomic,weak) id delegate;

@end
