//
//  OKTabbarController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKTabbarController.h"
#import "OKTabbarView.h"

#import "OKActivityViewController.h"
#import "OKFindFriendViewController.h"
#import "OKHomeViewController.h"
#import "OKDiscoverViewController.h"
#import "OKNavigationController.h"
#import "OKNearListViewController.h"
#import "OKFindShopViewController.h"
#import "OKNearFriendViewController.h"

@interface OKTabbarController ()<OKTabBarViewDelegate>

@end

@implementation OKTabbarController
{
    OKTabbarView * _customTabbar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTabbar];
    [self createController];
}


-(void)createTabbar
{
    _customTabbar=[[OKTabbarView alloc] init];
    
    _customTabbar.frame=self.tabBar.bounds;
    
   //    self.tabBar.hidden=YES;
    self.tabBar.translucent=NO;
    
    _customTabbar.delegate=self;
    
     [self.tabBar addSubview:_customTabbar];


}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     for (UIView * view in self.tabBar.subviews) {
         
         if ([view isKindOfClass:[UIControl class]]) {
             [view removeFromSuperview];
         }
        
    }
}


-(void)createController
{
    OKHomeViewController * homeController = [[OKHomeViewController alloc] init];
//    homeController.tabBarItem.image = [UIImage imageNamed:];
    [self setChilViewController:homeController WithImageName:@"nav_home" selectImageName:@"nav_home_on" title:@"首页"];
//    OKDiscoverViewController * discoverController = [[OKDiscoverViewController alloc] init];
//    [self setChilViewController:discoverController WithImageName:@"nav_find" selectImageName:@"nav_find_on" title:@"发现"];
    
    OKNearListViewController * nearViewController =[[OKNearListViewController alloc] init];
    [self setChilViewController:nearViewController WithImageName:@"nav_find" selectImageName:@"nav_find_on" title:@"发现"];
    
    
    
//    OKFindFriendViewController * findFriendController =[[OKFindFriendViewController alloc] init];
    OKNearFriendViewController * nearFriendController=[[OKNearFriendViewController alloc] init];
    [self setChilViewController:nearFriendController WithImageName:@"nav_message" selectImageName:@"nav_message_on" title:@"附近推荐"];
    
    OKActivityViewController * activityController = [[OKActivityViewController alloc]init];
    [self setChilViewController:activityController WithImageName:@"nav_mine" selectImageName:@"nav_mine_on" title:@"活动"];
    
    
}

-(void)setChilViewController:(UIViewController *)controller WithImageName:(NSString *)image selectImageName:(NSString *)selectImage title:(NSString *)title
{
    controller.title=title;
    controller.tabBarItem.image=[UIImage imageNamed:image];
    controller.tabBarItem.selectedImage=[UIImage imageNamed:selectImage];
    
    OKNavigationController * navController =[[OKNavigationController alloc] initWithRootViewController:controller];
    
    [self addChildViewController:navController];
    
    [_customTabbar addTabBarButtonWithItem:controller.tabBarItem];
    
}


-(void)buttonOnClick:(NSInteger)index{
    self.selectedIndex=index;
}

-(void)plusButtonClick{
    
    OKFindShopViewController * findShopController =[[OKFindShopViewController alloc] init];
    
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:findShopController];
    
    [self presentViewController:nav animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
