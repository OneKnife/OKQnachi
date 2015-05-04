//
//  OKActivityWebViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-28.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityWebViewController.h"

@interface OKActivityWebViewController ()

@end

@implementation OKActivityWebViewController
{
//    UIWebView * _webView;
}

-(instancetype)init
{
    if (self=[super init]) {
        
        self.webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, -54, SCREEN_WIDTH, SCREEN_HEIGHT+64)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    _webView.scrollView.bounces=NO;
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
