//
//  OKTabbarView.h
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OKTabBarViewDelegate <NSObject>

-(void)buttonOnClick:(NSInteger)index;

@end


@interface OKTabbarView : UIView

@property (nonatomic,weak) id delegate;
-(void)addTabBarButtonWithItem:(UITabBarItem *)item;


@end
