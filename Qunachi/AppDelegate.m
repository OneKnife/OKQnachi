//
//  AppDelegate.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "AppDelegate.h"
#import "OKTabbarController.h"
#import "OKHomeViewController.h"
#import "OKTools.h"
#import "OKWelcomeViewController.h"

#import <BaiduMapAPI/BMapKit.h>//引入所有的头文件


#import "OKMapTest.h"

@interface AppDelegate ()
{
//    UIWindow *window;
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
    
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"l1hBPAU2dtCxDK11QGUFDUHD"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    // Add the navigation controller's view to the window and display.
  
    
    
    NSString * imageFile = [[OKTools returnDocumentsPath] stringByAppendingPathComponent:WELCOME_IMAGE_NAME];
    
    if ([OKTools fileisExitWithFileName:imageFile]) {
        self.window.rootViewController=[[OKWelcomeViewController alloc] init];
    }
    else
    {
        OKTabbarController * tabbarController=[[OKTabbarController alloc] init];
        self.window.rootViewController=tabbarController;
    }
    
   
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
