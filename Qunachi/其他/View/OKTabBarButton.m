//
//  OKTabBarButton.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKTabBarButton.h"

@implementation OKTabBarButton

-(instancetype)init
{
    if (self=[super init]) {
        
        self.imageView.contentMode =UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:11];
    }
    
    return self;
    
}

-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    
    [self setImage:item.image forState:UIControlStateNormal];
    
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    [self setTitle:item.title forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
//    CGRect frame =self.frame;
//    frame = (CGRect){{0,0},self.currentImage.size};
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    return contentRect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect frame = contentRect;
    frame.origin.y=frame.size.height*0.6;
    frame.size.height=0.4*frame.size.height;
    return frame;
}



@end
