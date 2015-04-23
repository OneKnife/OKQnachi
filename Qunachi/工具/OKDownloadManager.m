//
//  OKDownloadManager.m
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKDownloadManager.h"
#import "AFNetworking.h"

@implementation OKDownloadManager

+(instancetype)manager
{
    static OKDownloadManager * manager =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

+(void)downloadWithUrl:(NSString *)urlStr filePath:(NSString *)filePath fileName:(NSString *)fileName succeed:(void (^)(BOOL))block
{
    NSFileManager * fileManager =[NSFileManager defaultManager];
    
    //拼接文件路径
    NSString * file = [NSString stringWithFormat:@"%@/%@",filePath,fileName];
    
    if ([fileManager fileExistsAtPath:file]) {
        NSError * error;
        [fileManager removeItemAtPath:file error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
    }
    if (![fileManager fileExistsAtPath:filePath]) {
        NSError * error;
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"%@",error);
        }
    }
    NSURL * url = [NSURL URLWithString:urlStr];
    
    AFHTTPRequestOperation * opreation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:url]];
    opreation.inputStream = [NSInputStream inputStreamWithURL:url];
    opreation.outputStream = [NSOutputStream outputStreamToFileAtPath:file append:NO];
    
    //下载进度控制
    /*
     [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
     NSLog(@"is download：%f", (float)totalBytesRead/totalBytesExpectedToRead);
     }];
     */
    
    [opreation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (block) {
            block(YES);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error!");
    }];
    
    [opreation start];
}



@end
