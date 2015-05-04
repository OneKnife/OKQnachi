//
//  OKActivityFreeDetailTopCellTableViewCell.m
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeDetailTopCell.h"
#import "UIImageView+WebCache.h"
@interface OKActivityFreeDetailTopCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *statueButton;
@property (weak, nonatomic) IBOutlet UILabel *leftTime;
@property (weak, nonatomic) IBOutlet UILabel *userNumLabel;

@end

@implementation OKActivityFreeDetailTopCell

- (void)awakeFromNib {
    // Initialization code
    self.statueButton.layer.masksToBounds=YES;
    self.statueButton.layer.cornerRadius=3;
    self.statueButton.layer.borderColor=[UIColor grayColor].CGColor;
    self.statueButton.layer.borderWidth=1;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKActivityFreeDetailModel *)model
{
    _model=model;
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:_model.Image] placeholderImage:[UIImage imageNamed:@"580290"]];
    self.titleLabel.text=_model.Title;
    self.timeLabel.text=_model.PartyTime;
    self.leftTime.text=[NSString stringWithFormat:@"%@天",_model.LastDays];
    self.userNumLabel.text=[NSString stringWithFormat:@"%@人",_model.UserNum];
}

@end
