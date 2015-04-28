//
//  OKMapTest.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKMapTest.h"
#import <BaiduMapAPI/BMapKit.h>
@interface OKMapTest ()<BMKMapViewDelegate>

@end

@implementation OKMapTest
{
    BMKMapView* _mapView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _mapView= [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:_mapView];
    
    
//    [self createLocation];
}

- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"BMKMapView控件初始化完成" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];
    alert = nil;
}


//-(void)createLocation
//{
//    
//    //设置定位精确度，默认：kCLLocationAccuracyBest
//    [BMKLocationServicesetLocationDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
//    //指定最小距离更新(米)，默认：kCLDistanceFilterNone
//    [BMKLocationServicesetLocationDistanceFilter:100.f];
//    
//    //初始化BMKLocationService
//    _locService = [[BMKLocationService alloc]init];
//    _locService.delegate = self;
//    //启动LocationService
//    [_locService startUserLocationService];
//}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}




@end
