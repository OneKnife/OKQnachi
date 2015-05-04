//
//  OKNearFriendCell.m
//  Qunachi
//
//  Created by qianfeng on 15-5-3.
//  Copyright (c) 2015年 zyc. All rights reserved.
//





#import "OKNearFriendCell.h"
#import "UIImageView+WebCache.h"


@interface OKNearFriendCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *mouthLabel;
@property (weak, nonatomic) IBOutlet UIView *timeView;

@end

@implementation OKNearFriendCell

- (void)awakeFromNib {
    // Initialization code
//    self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 103);
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModel:(OKNearFriendModel *)model
{
    _model=model;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:_model.AvatarUrl] placeholderImage:[UIImage imageNamed:@"64"]];
    
    self.userNameLabel.text=[NSString stringWithFormat:@"%@",_model.UserName];
    self.distanceLabel.text=_model.Distance;
    
    
    NSArray * monthArray =@[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    
    if (_model.LastAct.Type) {
        if (_model.LastAct.Type.intValue==3) {
            NSMutableAttributedString * str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"晒了一篇%@的探店",_model.LastAct.Title] attributes:nil];
            [str addAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(4, _model.LastAct.Title.length)];
            self.titleLabel.attributedText=str;
            
            //月份
            self.mouthLabel.text= monthArray[[_model.LastActTime substringWithRange:NSMakeRange(5, 2)].intValue-1];
            NSLog(@"%@",self.mouthLabel.text);
            
            self.dayLabel.text= [_model.LastActTime substringWithRange:NSMakeRange(8, 2)];
            
            self.timeView.hidden=NO;
        }
        else if (_model.LastAct.Type.intValue==1)
        {
            NSMutableAttributedString * str = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"晒了一道%@",_model.LastAct.Title] attributes:nil];
            [str addAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(4, _model.LastAct.Title.length)];
            self.titleLabel.attributedText=str;
            
            //月份
            self.mouthLabel.text= monthArray[[_model.LastActTime substringWithRange:NSMakeRange(5, 2)].intValue];
            NSLog(@"%@",self.mouthLabel.text);
            
            self.dayLabel.text= [_model.LastActTime substringWithRange:NSMakeRange(8, 2)];
            
            self.timeView.hidden=NO;
        }
    }
    
    else
    {
        self.titleLabel.text=@"没有任何动态";
        self.timeView.hidden=YES;
    }
    
    
}

-(void)setFrame:(CGRect)frame
{
    frame.size.height-=5;
    [super setFrame:frame];
    
}




@end
