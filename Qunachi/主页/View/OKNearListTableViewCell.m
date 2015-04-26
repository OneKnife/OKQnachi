//
//  OKNearListTableViewCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNearListTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface OKNearListTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipRecomImageVIew;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *attrTasteLabel;

@property (weak, nonatomic) IBOutlet UILabel *recommentLabel;

@property (weak, nonatomic) IBOutlet UILabel *paiCount;

@end

@implementation OKNearListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKNearListModel *)model
{
    _model=model;
    
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:_model.CoverUrl] placeholderImage:[UIImage imageNamed:@"180180"]];
    
    self.shopNameLabel.text=_model.ShopName;
    
    //计算shopName 的frame
    CGRect frame = [_model.ShopName boundingRectWithSize:CGSizeMake(500, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
    
    CGRect nameFrame = self.shopNameLabel.frame;
    nameFrame.size.width=frame.size.width+10;
    self.shopNameLabel.frame=nameFrame;
//    NSLog(@"%f",self.shopNameLabel.frame.size.width);
    
    if (_model.VipRecommCount==0) {
        self.vipRecomImageVIew.hidden=YES;
        CGRect vipFrame = self.vipRecomImageVIew.frame;
        vipFrame.origin.x=self.shopNameLabel.frame.origin.x+self.shopNameLabel.frame.size.width;
    }
    else
    {
        self.vipRecomImageVIew.hidden=NO;
    }
    
    self.addressLabel.text=_model.Address;
    self.distanceLabel.text=[NSString stringWithFormat:@"%ld 米",_model.Distance];
    if(_model.AttrTasteRate==0)
    {
        self.attrTasteLabel.text=@"口味暂无";
    }
    else
    {
        NSMutableAttributedString * attrString =[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"口味 %.1lf",_model.AttrTasteRate]];

        [attrString addAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, attrString.length)];
        [attrString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(3, 3)];
        
        self.attrTasteLabel.attributedText=attrString;
        
        
        
    }
    
    if (_model.RecommCount==0) {
        self.recommentLabel.hidden=YES;
    }
    else
    {
        self.recommentLabel.hidden=NO;
        self.recommentLabel.text=[NSString stringWithFormat:@"推荐 %ld",_model.RecommCount];
    }
    
    if (_model.PaiCount==0) {
        self.paiCount.hidden=YES;
    }
    else
    {
        self.paiCount.hidden=NO;
        self.paiCount.text=[NSString stringWithFormat:@"美食 %ld",_model.PaiCount];
    }
    
}



@end
