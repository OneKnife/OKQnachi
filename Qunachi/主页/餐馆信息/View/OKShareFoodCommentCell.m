//
//  OKShareFoodCommentCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-28.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShareFoodCommentCell.h"
#import "UIImageView+WebCache.h"

@interface OKShareFoodCommentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;


@end

@implementation OKShareFoodCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(OKShopShareFoodCommentModel *)model
{
    _model=model;
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    self.userNameLabel.text=model.UserName;
    self.dataLabel.text=[model.DateStr substringWithRange:NSMakeRange(5, 11)];
    self.commentLabel.text=model.Comment;
    
    CGRect cellFrame=self.frame;
    cellFrame.size.height=_model.cellHeight;
    
    CGRect descFrame =self.commentLabel.frame;
    descFrame.size.height=_model.descHeight;
    self.commentLabel.frame=descFrame;

    
    
}

@end
