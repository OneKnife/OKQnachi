//
//  OKTools.m
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKTools.h"

@implementation OKTools


+(NSString *)returnDocumentsPath
{
    
    NSString * homePath = NSHomeDirectory();
    NSString * path = [homePath stringByAppendingPathComponent:@"Documents"];
    return path;
}



+(BOOL)fileisExitWithFileName:(NSString *)fileName
{
    NSFileManager * manager =[NSFileManager defaultManager];
    return [manager fileExistsAtPath:fileName];
}


@end
