//
//  ZYCBanner.m
//  StarWardrobe
//
//  Created by qianfeng on 15-4-14.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "ZYCBanner.h"
#import "UIImageView+WebCache.h"


#define BANNER_HEIGHT 150
#define SCROLL_VIEW_HEIGHT 150



@interface ZYCBanner()<UIScrollViewDelegate>

@end

@implementation ZYCBanner
{
    UIScrollView * _scrollView ;
    UIPageControl * _pageController;
    NSTimer * _timer;
}
-(instancetype)init
{
    if (self=[super init]) {
        [self createBanner];
//        self.backgroundColor=[UIColor redColor];
        self.userInteractionEnabled = YES;
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, BANNER_HEIGHT);
    }
    return self;
}

-(void)createBanner
{
    
    //滚动视图
    _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCROLL_VIEW_HEIGHT)];
    _scrollView.delegate=self;
    _scrollView.pagingEnabled=YES;
    
    //pageController
   
    
    _pageController=[[UIPageControl alloc]initWithFrame:CGRectMake(0, SCROLL_VIEW_HEIGHT-30, 0, 30)];
//    _pageController.backgroundColor=[UIColor redColor];
    _pageController.currentPage=0;

    _timer =[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timeClick) userInfo:nil repeats:YES];

    [self addSubview:_scrollView];
    [self addSubview:_pageController];
    
}

-(void)setModelArray:(NSMutableArray *)modelArray
{
    _modelArray=modelArray;
    
    //总页数为数据模型数加2
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*(modelArray.count+2), 150);
    _pageController.numberOfPages=modelArray.count;
    
    
    
    for (NSInteger i=-1; i<(NSInteger)modelArray.count+1; i++) {
        if (modelArray.count==0) {
            break;
        }
        OKActivityBannerModel * model =nil;
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

        UIImageView * imageView =[[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH* (i+1), 0, SCREEN_WIDTH, SCROLL_VIEW_HEIGHT)];
        UIControl * control = [[UIControl alloc] initWithFrame:imageView.frame];
        control.tag = i;
        [control addTarget:self action:@selector(imageOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scrollView addSubview:control];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.Image]];
        [_scrollView addSubview:imageView];
       
    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageController.currentPage=scrollView.contentOffset.x/SCREEN_WIDTH+0.5;
    if (scrollView.contentOffset.x==SCREEN_WIDTH*(_modelArray.count+1)) {
        scrollView.contentOffset=CGPointMake(SCREEN_WIDTH, 0);
    }
    if (scrollView.contentOffset.x==0) {
        scrollView.contentOffset=CGPointMake(SCREEN_WIDTH*(_modelArray.count), 0);
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _timer.fireDate=[NSDate distantFuture];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    _timer.fireDate=[NSDate distantPast];
}


-(void)timeClick
{
    CGFloat offsetX=_scrollView.contentOffset.x+SCREEN_WIDTH;
    
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset=CGPointMake(offsetX, 0);
    }];
 
}


-(void)imageOnClick:(UIControl *)control
{
    NSInteger i =control.tag;
    OKActivityBannerModel * model =nil;
    //将最后一张图添加到第一页
    if (i==-1) {
        model=_modelArray[_modelArray.count-1];
    }
    //将第一张图添加到最后一页
    else if (i==_modelArray.count) {
        model=_modelArray[0];
    }
    else
    {
        model=_modelArray[i];
    }
    
    [self.delegate bannerOnclickWithUrl:model.Url];
    
    
}

@end
