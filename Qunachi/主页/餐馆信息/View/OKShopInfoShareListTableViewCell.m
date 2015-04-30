//
//  OKShopInfoShareListTableViewCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoShareListTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "OKTools.h"

@interface OKShopInfoShareListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel1;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel2;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel3;

@end

@implementation OKShopInfoShareListTableViewCell

- (void)awakeFromNib {
    // 给imageView 添加点击事件
    
    NSArray * array =@[_imageView1,_imageView2,_imageView3];
    
    for (NSInteger i=0; i<3; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:[array[i] bounds]];
//        [OKTools printFrameWithView:control];
        button.tag=100+i;
        [button addTarget:self action:@selector(imageClick:) forControlEvents:UIControlEventTouchUpInside];
        [array[i] setUserInteractionEnabled:YES];
        [array[i] addSubview:button];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setdataWithModel1:(OKShopInfoShareListModel *)model1 model2:(OKShopInfoShareListModel *)model2 model3:(OKShopInfoShareListModel *)model3
{
    _model1=model1;
    _model2=model2;
    _model3=model3;
    
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:_model1.Image] placeholderImage:[UIImage imageNamed:@"暂无数据"]];
    [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:_model2.Image] placeholderImage:[UIImage imageNamed:@"暂无数据"]];
    [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:_model3.Image] placeholderImage:[UIImage imageNamed:@"暂无数据"]];

    self.titleLabel1.text=_model1.Title;
    self.titleLabel2.text=_model2.Title;
    self.titleLabel3.text=_model3.Title;
    

}


-(void)imageClick:(UIButton *)button
{
    OKShopInfoShareListModel * model =nil;
    if (button.tag-100==0) {
        model=self.model1;
    }
    else if (button.tag-100==1)
    {
        model=self.model2;
    }
    else
    {
        model=self.model3;
    }
    
    [self.delegate shareListImageClick:model];
}

@end
