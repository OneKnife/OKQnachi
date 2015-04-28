//
//  OKFindFriendCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFindFriendCell.h"
#import "UIImageView+WebCache.h"

@interface OKFindFriendCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userInfoLabel;

@end

@implementation OKFindFriendCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)buttonClick:(id)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(OKFindFriendModel *)model
{
    _model=model;
    
    
    [self.avatarImage sd_setImageWithURL:[NSURL URLWithString:_model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    
    self.userNameLabel.text=_model.UserName;
    self.userInfoLabel.text=[NSString stringWithFormat:@"关注%@ 粉丝%@ 美食%@",_model.FollowCount,_model.FansCount,_model.ShareCount];
    
    
}

@end
