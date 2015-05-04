//
//  OKActivityFreeDetailCell.h
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKActivityFreeDetailCell : UITableViewCell

@property (nonatomic,copy) NSString * detail;
@property (nonatomic,strong) NSNumber * height;

-(void)setDetail:(NSString *)detail andHeight:(NSNumber *)height;


@end
