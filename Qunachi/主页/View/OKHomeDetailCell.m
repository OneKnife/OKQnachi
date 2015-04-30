//
//  OKHomeDetailCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeDetailCell.h"
#import "UIButton+WebCache.h"
@interface OKHomeDetailCell()

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userGenderImageView;
@property (weak, nonatomic) IBOutlet UILabel *costTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *InvitedLabel;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *CityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *jumpShop;

@end
@implementation OKHomeDetailCell

- (void)awakeFromNib {
    // Initialization code
    
//    self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 200);
    
    self.avatarButton.layer.masksToBounds=YES;
    self.avatarButton.layer.cornerRadius=5;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.jumpShop.layer.masksToBounds=YES;
    self.jumpShop.layer.cornerRadius=3;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKHomeDetailModel *)model
{
    _model=model;
    [self.avatarButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.AvatarUrl] forState:UIControlStateNormal];
    self.userNameLabel.text=model.UserName;
    self.ageLabel.text=[NSString stringWithFormat:@"%@岁",model.Age];
    
    if (model.UserGender==0) {
        self.userGenderImageView.image=[UIImage imageNamed:@"ico_woman_2"];
    }
    else
    {
        self.userGenderImageView.image=[UIImage imageNamed:@"ico_man_2"];
    }


    if (model.CostType.intValue==1) {
        self.costTypeLabel.text=@"我请客";
    }
    else if (model.CostType.intValue==2)
    {
        self.costTypeLabel.text=@"AA";
    }
    else if (model.CostType.intValue==3)
    {
        self.costTypeLabel.text=@"你请客";
    }
    
    if (model.Invited==0) {
        self.InvitedLabel.text=@"只约女生";
        self.InvitedLabel.textColor=[UIColor redColor];
    }
    else if (model.Invited.intValue==1)
    {
        self.InvitedLabel.text=@"只约男生";
        self.InvitedLabel.textColor=[UIColor greenColor];
    }
    else if(model.Invited.intValue==2)
    {
        self.InvitedLabel.text=@"男女不限";
        self.InvitedLabel.textColor=[UIColor grayColor];
    }
    
    self.startTimeLabel.text=model.StartTime;
    self.CityNameLabel.text=model.CityName;
    
    self.addressLabel.text=model.Address;

    self.titleLabel.text=[NSString stringWithFormat:@"%@",model.Title];
    
}


-(void)setFrame:(CGRect)frame
{
    
    frame.size.height=frame.size.height-8;
    [super setFrame:frame];
}

- (IBAction)jumpShop:(id)sender {
    [self.delegate jumpShopInfoControllerWithshopId:_model.ShopId];
}

@end
