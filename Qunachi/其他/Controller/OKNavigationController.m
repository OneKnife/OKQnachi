//
//  OKNavigationController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNavigationController.h"

@interface OKNavigationController ()

@end

@implementation OKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavBar];
}

-(void)customNavBar
{
    [self.navigationBar setBarTintColor:[UIColor orangeColor]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
