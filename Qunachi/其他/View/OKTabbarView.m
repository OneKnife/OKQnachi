//
//  OKTabbarView.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKTabbarView.h"
#import "OKTabBarButton.h"


@interface OKTabbarView()

//@property (nonatomic,weak) OKTabBarButton * plusButton;

@property (nonatomic,strong) NSMutableArray * buttonArray;
@end

@implementation OKTabbarView
{
    OKTabBarButton * _plusButton;
    UIButton * _selectedButton;
}

-(instancetype)init
{
    if (self =[super init]) {
        
        _buttonArray = [[NSMutableArray alloc] init];
        
        [self customeView];
    }
    return self;
}


-(void)customeView
{
    UIImageView * imageView =[[UIImageView alloc] init];
    UIImage * image =[UIImage imageNamed:@"bg_nav"];
    imageView.image=image;
    
    _plusButton =[UIButton buttonWithType:UIButtonTypeCustom];
    [_plusButton setImage:[UIImage imageNamed:@"nav_more"] forState:UIControlStateNormal];
//    [_plusButton setImage:[UIImage imageNamed:@"nav_more"] forState:UIControlStateSelected];
    
    _plusButton.bounds=CGRectMake(0, 0, _plusButton.currentImage.size.width, _plusButton.currentImage.size.height);
        [self addSubview:_plusButton];
    [_plusButton addTarget:self action:@selector(plusButtonClick) forControlEvents:UIControlEventTouchUpInside];

    
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    OKTabBarButton * button = [[OKTabBarButton alloc]init];
    
    button.item=item;
    
    [self.buttonArray addObject:button];
    
    if (self.buttonArray.count==1) {
        [self onClick:button];
    }
    
}

-(void)layoutSubviews
{
    _plusButton.center = CGPointMake(SCREEN_WIDTH/2, self.frame.size.height/2);
    
    [self addSubview:_plusButton];

    
    float buttonW = SCREEN_WIDTH/(self.buttonArray.count+1);
    
    for (NSInteger i =0; i<self.buttonArray.count; i++) {
        OKTabBarButton * button = self.buttonArray[i];
        
        float buttonX = i<=1?i*buttonW:(i+1)*buttonW;
        button.frame=CGRectMake(buttonX,0, buttonW, 49);
        [self addSubview:button];
        
        button.tag = i;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.adjustsImageWhenHighlighted=NO;
    }
    
}

-(void)onClick:(UIButton *)button
{
    _selectedButton.selected=NO;
    button.selected=YES;
    
    [self.delegate buttonOnClick:button.tag];
    _selectedButton=button;
}


-(void)plusButtonClick
{
    [self.delegate plusButtonClick];
}


@end
