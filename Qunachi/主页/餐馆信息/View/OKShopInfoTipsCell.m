//
//  OKShopInfoTipsCell.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoTipsCell.h"

@interface OKShopInfoTipsCell ()

@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;


@end

@implementation OKShopInfoTipsCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


    
}


-(void)setTipsArray:(NSMutableArray *)tipsArray
{
    _tipsArray=tipsArray;
    
    NSMutableString *  tipsStr= [[NSMutableString alloc]init];
    NSInteger i=0;
    for (NSString * tip in _tipsArray) {
        [tipsStr appendFormat:@"%@ ",tip];
        if (i==3) {
            [tipsStr appendFormat:@"\n"];
        }
    }
  
    self.tipsLabel.text=tipsStr;
    
}

@end
