//
//  OKHomeInfoImageViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeInfoImageViewController.h"
#import "OKShopInfoImageScrollView.h"
@interface OKHomeInfoImageViewController ()

@end

@implementation OKHomeInfoImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollImageView];
    
}
-(void)createScrollImageView
{
    OKShopInfoImageScrollView * scrollImageView =[[OKShopInfoImageScrollView alloc] init];
    scrollImageView.modelArray = self.array;
    [self.view addSubview:scrollImageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
