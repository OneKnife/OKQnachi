//
//  OKHomeListTableViewCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeListTableViewCell.h"
#import "UIButton+WebCache.h"
@interface OKHomeListTableViewCell()

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userGenderImageView;
@property (weak, nonatomic) IBOutlet UILabel *costTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *InvitedLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *CityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *applyCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation OKHomeListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
//    self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 200);
    
    self.avatarButton.layer.masksToBounds=YES;
    self.avatarButton.layer.cornerRadius=5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKYuefanListModel *)model
{
    _model=model;
    [self.avatarButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.AvatarUrl] forState:UIControlStateNormal];
    self.userNameLabel.text=model.UserName;
    self.ageLabel.text=[NSString stringWithFormat:@"%ld岁",model.Age];
    
    if (model.UserGender==0) {
        self.userGenderImageView.image=[UIImage imageNamed:@"ico_woman_2"];
    }
    else
    {
        self.userGenderImageView.image=[UIImage imageNamed:@"ico_man_2"];
    }


    if (model.CostType==1) {
        self.costTypeLabel.text=@"我请客";
    }
    else if (model.CostType==2)
    {
        self.costTypeLabel.text=@"AA";
    }
    else if (model.CostType==3)
    {
        self.costTypeLabel.text=@"你请客";
    }
    
    if (model.Invited==0) {
        self.InvitedLabel.text=@"只约女生";
        self.InvitedLabel.textColor=[UIColor redColor];
    }
    else if (model.Invited==1)
    {
        self.InvitedLabel.text=@"只约男生";
        self.InvitedLabel.textColor=[UIColor greenColor];
    }
    else if(model.Invited==2)
    {
        self.InvitedLabel.text=@"男女不限";
        self.InvitedLabel.textColor=[UIColor grayColor];
    }
    
    self.startTimeLabel.text=model.StartTime;
    self.CityNameLabel.text=model.CityName;
    
    self.addressLabel.text=model.Address;
    self.distanceLabel.text=model.Distance;

    self.viewCountLabel.text=[NSString stringWithFormat:@"%ld人看过",model.ViewCount];
    
    self.applyCountLabel.text=[NSString stringWithFormat:@"%ld人报名",model.ApplyCount];

    self.commentCountLabel.text=[NSString stringWithFormat:@"%ld",model.CommentCount];
    self.titleLabel.text=model.Title;
    
}


-(void)setFrame:(CGRect)frame
{
    
    frame.size.height=frame.size.height-8;
    [super setFrame:frame];
}


@end
