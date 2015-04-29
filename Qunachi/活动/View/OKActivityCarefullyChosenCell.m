//
//  OKActivityCarefullyChosenCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityCarefullyChosenCell.h"
#import "UIImageView+WebCache.h"

@interface OKActivityCarefullyChosenCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation OKActivityCarefullyChosenCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKActivityCarefullyChosenModel *)model
{
    _model=model;
    
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:_model.Image] placeholderImage:[UIImage imageNamed:@"bg_big_default"]];
    self.titleLabel.text =_model.Title;
    
}

@end
