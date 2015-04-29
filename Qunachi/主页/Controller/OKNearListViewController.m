//
//  OKNearListViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-25.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNearListViewController.h"
#import "AFNetworking.h"
#import "OKNearListModel.h"
#import "OKNearListTableViewCell.h"
#import "UIView+PSBTransitionAnimation.h"
#import "OKShopInfoViewController.h"
#import "MJRefresh.h"

#import <BaiduMapAPI/BMapKit.h>
@interface OKNearListViewController ()<UITableViewDataSource,UITableViewDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate>

#define NEAR_LIST_URL @"http://api.qunachi.com/v5.2.0/Search/Shop/getShopList?appid=1&hash=8feef06577026d6fc9d0414fe106e062&deviceid=172fe65995535e9670307f288722585&channel=appstore"


@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation OKNearListViewController
{
    UITableView * _tableView;
    //地图页面
    UIView * _mapView;
    //地图
    BMKMapView * _mapViewMap ;
    UIButton * _rightButton;
    BOOL _isMapView;
    
    BOOL _annOnce;
    BOOL _locationOnce;
    
    BMKLocationService * _locService;
    
    CLLocation * _location;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRightNavButton];
    [self createMapView];
    
    [self createTableView];
    

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(void)createTableView
{
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-108) style:UITableViewStylePlain];
    
    self.automaticallyAdjustsScrollViewInsets =NO;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.rowHeight=96;
    [_tableView setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1]];
    
    
    // 添加传统的下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    
    [self.view addSubview:_tableView];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellID=@"nearListCell";
    
    OKNearListTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKNearListTableViewCell" owner:nil options:nil].lastObject;
        
    }
    
    
    cell.model=self.dataArray[indexPath.row];
    
    return cell;
}

#pragma mark - 选中某一行

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKShopInfoViewController * shopInfoViewController =[[OKShopInfoViewController alloc] init];
    

//    shopInfoViewController.shopid=;
    
//    NSInteger temp =;
    
//    NSLog(@"%@", );
    
    shopInfoViewController.shopId=[self.dataArray[indexPath.row] ShopId];
    
    [self.navigationController pushViewController:shopInfoViewController animated:YES];
    
    
}


-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc] init];
        
        // 马上进入刷新状态
        [_tableView.header beginRefreshing];
    }
    
    return _dataArray;
}





#pragma mark - 右键

-(void)createRightNavButton
{
    _rightButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [_rightButton setImage:[UIImage imageNamed:@"map_ico_on"] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:@"map_ico_liebiao"] forState:UIControlStateSelected];
    
    _rightButton.adjustsImageWhenHighlighted=NO;
    
    _rightButton.enabled=NO;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:_rightButton];
    
    [_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    
}

-(void)rightButtonClick:(UIButton *)button
{
    
    [self.view setTransitionAnimationType:PSBTransitionAnimationTypeCube toward:PSBTransitionAnimationTowardFromRight duration:0.2];
    
    //如果当前是列表页面
    if (!_isMapView) {

        [self.view bringSubviewToFront:_mapView];

        
    }
    //地图页面
    else
    {
        [self.view bringSubviewToFront:_tableView];

    }
    button.selected=!button.isSelected;
    _isMapView=!_isMapView;
    
}






#pragma mark - 百度地图回调

-(void)createMapView
{
    _mapView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-108)];
    
    _mapView.backgroundColor=[UIColor whiteColor];
    
    _mapViewMap=[[BMKMapView alloc]initWithFrame:_mapView.bounds];
    
    _locService = [[BMKLocationService alloc]init];
    
    [_mapView addSubview:_mapViewMap];
    [self.view addSubview:_mapView];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, SCREEN_HEIGHT-170, 30, 30)];
    [button setImage:[UIImage imageNamed:@"ico_this_close"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor whiteColor]];
    [_mapViewMap addSubview:button];
}

-(void)findUserLocation
{
    _mapViewMap.centerCoordinate=_location.coordinate;
}

/**添加大头针*/
-(void)createAnnotation
{
 /* 一个大头针示例
    BMKPointAnnotation * annotation =[[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    
    annotation.coordinate = coor;
    annotation.title = @"test";
    annotation.subtitle = @"此Annotation可拖拽!";

    [_mapViewMap addAnnotation:annotation];
  */
    
    for (OKNearListModel * model in self.dataArray) {
        BMKPointAnnotation * annotation =[[BMKPointAnnotation alloc] init];
        CLLocationCoordinate2D coor;
        coor.latitude=model.Lat.doubleValue;
        coor.longitude=model.lng.doubleValue;
        annotation.coordinate=coor;
        annotation.title=model.ShopName;
        annotation.subtitle=model.Address;
        
        [_mapViewMap addAnnotation:annotation];
    }
 

    
    

}


/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapViewMap updateLocationData:userLocation];
    //    NSLog(@"heading is %@",userLocation.heading);
    
//    NSLog(@"location :%@",userLocation.location);
    
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_mapViewMap updateLocationData:userLocation];
    
    _location=userLocation.location;
   
    if (_locationOnce==NO) {
        _mapViewMap.centerCoordinate=userLocation.location.coordinate;
        _locationOnce=YES;
    }
    
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if (_mapViewMap) {
        _mapViewMap = nil;
    }
}

#pragma mark 地图标识及回调

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = NO;
//            annotationView.accessibilityIdentifier
        }
        return annotationView;
    
    
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view
{
    NSLog(@"%@",view.annotation.title);
    
    for (OKNearListModel * model in self.dataArray) {
        if ([model.ShopName isEqualToString:view.annotation.title]) {
            
            OKShopInfoViewController * shopInfoController =[[OKShopInfoViewController alloc] init];
            shopInfoController.ShopId=model.ShopId;
            
            [self.navigationController pushViewController:shopInfoController animated:YES];
            break;
            
        }
    }
    

}



#pragma mark - 系统回调
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_mapViewMap viewWillAppear];
    _mapViewMap.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    
    [_locService startUserLocationService];
    _mapViewMap.showsUserLocation = NO;//先关闭显示的定位图层
    _mapViewMap.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    _mapViewMap.showsUserLocation = YES;//显示定位图层
    [_mapViewMap setZoomLevel:18];


}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [_mapViewMap viewWillDisappear];
    _mapViewMap.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
}


-(void)loadNewData
{
    [_dataArray removeAllObjects];
    
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    
    NSUserDefaults * user =[NSUserDefaults standardUserDefaults];
    
    NSString * lat = [NSString stringWithFormat:@"%f",[user floatForKey:@"lat"]];
    NSString * lon = [NSString stringWithFormat:@"%f",[user floatForKey:@"lon"]];
    
    
    NSDictionary * param =@{@"cityid":@"2",
                            @"dist":@"0",
                            @"distance":@"500",
                            @"lat":lat,
                            @"limit":@"20",
                            @"lng":lon,
                            @"offset":@"0",
                            @"sort":@"1"};
    
    
    
    [manager POST:[NSString stringWithFormat:NEAR_LIST_URL] parameters:param success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        for (NSDictionary * itemDict in responseObject[@"result"][@"List"]) {
            OKNearListModel * model =[[OKNearListModel alloc] init];
            [model setValuesForKeysWithDictionary:itemDict];
            [_dataArray addObject:model];
        }
        
        [_tableView reloadData];
        
        _rightButton.enabled=YES;
        
        
        if (!_annOnce) {
            [self createAnnotation];
            _annOnce=YES;
        }
        
        
        
        [_tableView.header endRefreshing];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"near list request err!");
        [_tableView.header endRefreshing];
    }];

}



@end
