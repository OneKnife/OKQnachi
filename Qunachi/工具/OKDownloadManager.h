//
//  OKDownloadManager.h
//  Qunachi
//
//  Created by qianfeng on 15-4-23.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKDownloadManager : NSObject


//+(instancetype)manager;
/**block返回值为是否成功*/
+(void)downloadWithUrl:(NSString *)url filePath:(NSString *)filePath fileName:(NSString *)fileName succeed:(void(^)(BOOL success))block;



@end