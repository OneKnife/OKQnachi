//
//  OKShopInfoSection1Row1Cell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoSection1Row1Cell.h"
#import "UIImageView+WebCache.h"
#import "OKShopInfoTagsModel.h"

@interface OKShopInfoSection1Row1Cell ()
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *areaNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *tastRateLabel;

@property (weak, nonatomic) IBOutlet UILabel *recommentLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCountLabel;

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;


@property (weak, nonatomic) IBOutlet UIButton *sendFoodButton;

@property (weak, nonatomic) IBOutlet UIButton *togetherButton;



@end

@implementation OKShopInfoSection1Row1Cell

- (void)awakeFromNib {
    // Initialization code
    UIImage * image = [UIImage imageNamed:@"btnBig_orange.png"];
    
    image =[image stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    [self.sendFoodButton setBackgroundImage:image forState:UIControlStateNormal];
    [self.togetherButton setBackgroundImage:image forState:UIControlStateNormal];
    UIControl * imageControl =[[UIControl alloc] initWithFrame:self.coverImageView.frame];
    //调用代理的方法
    [imageControl addTarget:self.delegate action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:imageControl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OKShopInfoModel *)model
{
    _model=model;
    self.shopNameLabel.text=model.ShopName;
//    self.areaNameLabel.text=model.AreaName;
    
    NSMutableString *  tagsStr= [[NSMutableString alloc]init];
    for (OKShopInfoTagsModel * tag in _model.Tags) {
        [tagsStr appendFormat:@"%@ ",tag.Name];
    }
    self.areaNameLabel.text = tagsStr;
    
    
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:_model.Cover]];
    
    if(_model.TasteRate==0)
    {
        self.tastRateLabel.text=@"口味暂无";
    }
    else
    {
        
        NSMutableAttributedString * attrString =[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"口味 %.1lf",_model.TasteRate]];
        
        [attrString addAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, attrString.length)];
        [attrString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(3, 3)];
        
        self.tastRateLabel.attributedText=attrString;
        
        
        
    }
    
    
    if (_model.RecommendCount==0) {
        self.recommentLabel.hidden=YES;
    }
    else
    {
        self.recommentLabel.hidden=NO;
        self.recommentLabel.text=[NSString stringWithFormat:@"推荐 %ld",_model.RecommendCount];
    }
    
    
    self.favoriteCountLabel.text= [NSString stringWithFormat:@"收藏 %ld",(long)_model.FavoriteCount];
    
    self.addressLabel.text = _model.Address;
    
    NSMutableString * phoneStr = [[NSMutableString alloc]init];
    for (NSString *str in _model.Phone) {
        [phoneStr appendFormat:@"%@ ",str];
    }
    self.phoneLabel.text = phoneStr;
    
}


@end
