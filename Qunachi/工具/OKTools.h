//
//  OKTools.h
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OKTools : NSObject

+(NSString *)returnDocumentsPath;

+(BOOL)fileisExitWithFileName:(NSString *)fileName;

+(void)printFrameWithView:(UIView *)view;
@end
