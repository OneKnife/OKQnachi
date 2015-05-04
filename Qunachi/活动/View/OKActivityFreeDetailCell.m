//
//  OKActivityFreeDetailCell.m
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeDetailCell.h"

@implementation OKActivityFreeDetailCell
{
    UILabel * _label;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createCell];
    }
    return self;
}

-(void)createCell
{
    _label=[[UILabel alloc] init];
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 15);
    
    _label.frame=CGRectMake(5, 2, SCREEN_WIDTH-10, 12);
    _label.font=[UIFont systemFontOfSize:12];
    _label.numberOfLines=0;
    [self addSubview:_label];
    _label.textColor=[UIColor blackColor];
}

-(void)setDetail:(NSString *)detail andHeight:(NSNumber *)height
{
    _detail=detail;
    
    _label.text=_detail;
    
    CGRect frame = self.frame;
    frame.size.height=height.floatValue+4;
    self.frame=frame;
    
    CGRect textFrame =_label.frame;
    textFrame.size.height=height.floatValue;
    _label.frame=textFrame;
    
}


@end
