//
//  OKFriendViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFriendViewController.h"
#import "OKFriendModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

#define USER_URL @"http://api.qunachi.com/v5.2.0/Home/Wo/getInfoByUserId?appid=1&hash=4817e422ab2ea93f99a3df3ca0f8e798&deviceid=172fe65995535e9670307f288722585&channel=appstore&uid=%@"

@interface OKFriendViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *GenderImageView;
@property (weak, nonatomic) IBOutlet UILabel *expNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIButton *mailButton;
@property (weak, nonatomic) IBOutlet UIButton *userInfoButton;

@end

@implementation OKFriendViewController
{
    OKFriendModel* _model;


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self requestData];
    
    [self customButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customButton {
    // Initialization code

    [self.mailButton setBackgroundImage:[[UIImage imageNamed:@"btnBig_orange.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    [self.userInfoButton setBackgroundImage:[[UIImage imageNamed:@"btnBig_orange.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
    
    self.mailButton.center=CGPointMake(SCREEN_WIDTH/2, self.mailButton.center.y);
    self.userInfoButton.center=CGPointMake(SCREEN_WIDTH/2, self.userInfoButton.center.y);
}


-(void)requestData
{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:USER_URL,_uid] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        _model =[[OKFriendModel alloc] init];
        [_model setValuesForKeysWithDictionary:responseObject[@"result"]];
        
        [self refreshView];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"user request err!");
    }];
    
}

-(void)refreshView
{
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:_model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    self.userNameLabel.text=_model.UserName;
    if ([_model.Gender intValue]==0) {
        self.GenderImageView.image=[UIImage imageNamed:@"ico_woman_2"];
    }
    else
    {
        self.GenderImageView.image=[UIImage imageNamed:@"ico_man_2"];
    }
    self.expNameLabel.text = _model.ExpName;
    
    
    self.infoLabel.text =[NSString stringWithFormat:@"关注：%@ 豆币：%@ 粉丝：%@",_model.FollowCount,_model.Wealth,_model.FansCount];
    
    if ([_model.Province isEqualToString:@""]) {
        self.provinceLabel.text=@"无";
    }
    else
    {
        self.provinceLabel.text=_model.Province;
    }
    if ([_model.City isEqualToString:@""]) {
        self.cityLabel.text=@"无";
    }
    else
    {
        self.cityLabel.text=_model.City;
    }
    
    
    
}

@end
