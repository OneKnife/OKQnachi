//
//  OKShopInfoImageScrollView.m
//  StarWardrobe
//
//  Created by qianfeng on 15-4-14.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoImageScrollView.h"
#import "UIImageView+WebCache.h"
#import "OKShopInfoImagesModel.h"

#define BANNER_HEIGHT SCREEN_HEIGHT

@interface OKShopInfoImageScrollView()<UIScrollViewDelegate>

@end

@implementation OKShopInfoImageScrollView
{
    UIScrollView * _scrollView ;
}
-(instancetype)init
{
    if (self=[super init]) {
        [self createBanner];
        self.backgroundColor=[UIColor whiteColor];
        self.userInteractionEnabled = YES;
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44);
    }
    return self;
}

-(void)createBanner
{
    
    //滚动视图
    _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44)];
    _scrollView.delegate=self;
    _scrollView.pagingEnabled=YES;
    
  
    [self addSubview:_scrollView];

    
}

-(void)setModelArray:(NSMutableArray *)modelArray
{
    _modelArray=modelArray;
    
    //总页数为数据模型数加2
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*(modelArray.count+2), 0);

    
    for (NSInteger i=-1; i<(NSInteger)modelArray.count+1; i++) {
        if (modelArray.count==0) {
            break;
        }
        OKShopInfoImagesModel * model =nil;
        //将最后一张图添加到第一页
        if (i==-1) {
            model=modelArray[modelArray.count-1];
        }
        //将第一张图添加到最后一页
        else if (i==modelArray.count) {
            model=modelArray[0];
        }
        else
        {
            model=modelArray[i];
        }

        UIImageView * imageView =[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH* (i+1), 0, SCREEN_WIDTH, BANNER_HEIGHT-44)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.Image]];
        [_scrollView addSubview:imageView];
       
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x==SCREEN_WIDTH*(_modelArray.count+1)) {
        scrollView.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
    }
    if (scrollView.contentOffset.x==0) {
        scrollView.contentOffset=CGPointMake(SCREEN_WIDTH*(_modelArray.count), 0);
    }
    
}




@end
