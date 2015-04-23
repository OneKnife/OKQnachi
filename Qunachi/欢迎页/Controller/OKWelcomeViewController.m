//
//  OKWelcomeViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKWelcomeViewController.h"
#import "OKDownloadManager.h"
#import "OKTabbarController.h"
#import "OKTools.h"

@interface OKWelcomeViewController ()

@end

@implementation OKWelcomeViewController
{
    NSTimer * _timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addImage];
}

-(void)addImage
{
    _timer =[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerClick) userInfo:nil repeats:NO];
    
    NSString * fileName =[[OKTools returnDocumentsPath] stringByAppendingPathComponent:WELCOME_IMAGE_NAME];
    if ([OKTools fileisExitWithFileName:fileName]) {
        
        
        UIImage * image = [[UIImage alloc] initWithContentsOfFile:fileName];
        UIImageView * imageView =[[UIImageView alloc] initWithFrame:self.view.frame];
        imageView.image=image;
        [self.view addSubview:imageView];
    }
    
}

-(void)timerClick
{
    self.view.window.rootViewController=[[OKTabbarController alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
