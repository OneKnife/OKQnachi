//
//  OKHomeDetailCommentCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeDetailCommentCell.h"
#import "UIImageView+WebCache.h"

@interface OKHomeDetailCommentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation OKHomeDetailCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKHomeDetailCommentModel *)model
{
    _model=model;
    
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    
    self.nameLabel.text=_model.UserName;
    self.commentLabel.text=_model.Comment;
    self.timeLabel.text=[_model.DateStr substringWithRange:NSMakeRange(5, 11)];
    
}

@end
