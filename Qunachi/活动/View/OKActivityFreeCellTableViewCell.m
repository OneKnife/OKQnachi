//
//  OKActivityFreeCellTableViewCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeCellTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface OKActivityFreeCellTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopName;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *userCount;

@end

@implementation OKActivityFreeCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKActivityFreeModel *)model
{
    
    _model=model;
    
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:model.Image] placeholderImage:[UIImage imageNamed:@"9898"]];
    self.titleLabel.text=model.Title;
    self.timeLabel.text= [NSString stringWithFormat:@"活动时间 %@",[model.Time substringWithRange:NSMakeRange(5, 11)]];
    self.shopName.text=model.ShopName;
    
    self.userCount.text=[NSString stringWithFormat:@"%@人参与",model.ApplyUserCount];
    
    if (model.Status.intValue==4) {
        self.stateLabel.text=@"活动结束";
    }
    else
    {
        self.stateLabel.text=@"火热报名";
    }
}


@end
