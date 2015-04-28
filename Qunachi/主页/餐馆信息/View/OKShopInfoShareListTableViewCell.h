//
//  OKShopInfoShareListTableViewCell.h
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OKShopInfoShareListModel.h"

@protocol OKShopInfoShareListDelegate <NSObject>

-(void)shareListImageClick:(OKShopInfoShareListModel *)model;

@end

@interface OKShopInfoShareListTableViewCell : UITableViewCell


@property (nonatomic,strong) OKShopInfoShareListModel * model1;
@property (nonatomic,strong) OKShopInfoShareListModel * model2;
@property (nonatomic,strong) OKShopInfoShareListModel * model3;
@property (nonatomic,weak) id delegate;

-(void)setdataWithModel1:(OKShopInfoShareListModel *)model1 model2:(OKShopInfoShareListModel *)model2 model3:(OKShopInfoShareListModel *)model3;


@end
