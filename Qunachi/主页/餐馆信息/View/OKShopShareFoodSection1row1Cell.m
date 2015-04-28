//
//  OKShopShareFoodSection1row1Cell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopShareFoodSection1row1Cell.h"
#import "UIImageView+WebCache.h"

@interface OKShopShareFoodSection1row1Cell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@end

@implementation OKShopShareFoodSection1row1Cell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(OKShopShareFoodModel *)model
{
    _model=model;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:_model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    self.userNameLabel.text=_model.UserName;
    self.createTimeLabel.text=[_model.CreateTime substringWithRange:NSMakeRange(5, 11)];
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:_model.Image] placeholderImage:[UIImage imageNamed:@"9898"]];
    self.titleLabel.text=_model.Title;
    self.descLabel.text=_model.Desc;
    
    CGRect cellFrame=self.frame;
    cellFrame.size.height=_model.cellHeight;
    
    CGRect descFrame =self.descLabel.frame;
    descFrame.size.height=_model.descHeight;
    self.descLabel.frame=descFrame;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
