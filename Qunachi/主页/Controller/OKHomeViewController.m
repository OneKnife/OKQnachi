//
//  OKHomeViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeViewController.h"
#import "AFNetworking.h"
#import "OKDownloadManager.h"
#import <BaiduMapAPI/BMapKit.h>

@interface OKHomeViewController ()<BMKLocationServiceDelegate>

@end

@implementation OKHomeViewController
{
    NSTimer * _timer;
    UIButton * _yuefan;
    BMKLocationService* _locService;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self createTimer];
    //下载欢迎页面图片
    [self requestWelcomePage];
    //获取定位
    [self getLocation];
    
}

-(void)customNavBar
{
    UIImageView * titleView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.titleView=titleView;
    
    UIBarButtonItem * rightButton =[[UIBarButtonItem alloc] initWithTitle:@"附近" style:UIBarButtonItemStyleDone target:self action:@selector(rightNavButtonOnClick)];
    rightButton.tintColor=[UIColor whiteColor];
    [rightButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=rightButton;
    
    
    
}


-(void)createUI
{
    UIImageView * backgroundImage =[[UIImageView alloc]init];
    backgroundImage.frame=self.view.frame;
    backgroundImage.image=[UIImage imageNamed:@"bg_yuefan.jpg"];
    [self.view addSubview:backgroundImage];
    
    
    //主页中间文字
    UIImageView * textView =[[UIImageView alloc]init];
    UIImage * textImage = [UIImage imageNamed:@"text_1"];
    textView.image=textImage;
    textView.frame=(CGRect){0,0,textImage.size};
    textView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-50);
    [self.view addSubview:textView];
    
    
    //长按搜索附近的约饭
    UIImageView * tipView =[[UIImageView alloc]init];
    UIImage * tipImage = [UIImage imageNamed:@"text_2"];
    tipView.image=tipImage;
    tipView.frame=(CGRect){0,0,tipImage.size};
    tipView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+100);
    [self.view addSubview:tipView];
    
    
    //约！
    _yuefan=[[UIButton alloc] init];
    [_yuefan setBackgroundImage:[UIImage imageNamed:@"btn_yue"] forState:UIControlStateNormal];
    _yuefan.frame=CGRectMake(0, 0, 80, 80);
    _yuefan.center=CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2+150);
    [_yuefan addTarget:self action:@selector(yuefanTouchDown) forControlEvents:UIControlEventTouchDown];
    [_yuefan addTarget:self action:@selector(yuefanTouchUp) forControlEvents:UIControlEventTouchCancel|UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    [self.view addSubview:_yuefan];
   
}

-(void)createTimer
{
    _timer =[NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
    _timer.fireDate =[NSDate distantFuture];
}


#pragma mark - 约！
-(void)yuefanTouchDown
{
    _timer.fireDate=[NSDate distantPast];
}

-(void)yuefanTouchUp
{
    _timer.fireDate=[NSDate distantFuture];
}

-(void)timerClick
{

    UIView * cricle =[[UIView alloc] initWithFrame:CGRectMake(0, 0, _yuefan.frame.size.width, _yuefan.frame.size.height)];
    cricle.center=_yuefan.center;
    cricle.layer.masksToBounds=YES;
    cricle.alpha=0.5;
    cricle.layer.cornerRadius=_yuefan.frame.size.width/2;
    cricle.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:cricle];
    [self.view bringSubviewToFront:_yuefan];

    [UIView animateWithDuration:2 animations:^{
  
        cricle.transform=CGAffineTransformMakeScale(10, 10);
        cricle.alpha=0;
    } completion:^(BOOL finished) {
        [cricle removeFromSuperview];
    }];
}



#pragma mark - 附近按钮
-(void)rightNavButtonOnClick
{
    
}

#pragma mark - 数据源

/**请求欢迎页*/
-(void)requestWelcomePage
{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET:@"http://api.qunachi.com/v5.2.0/Common/Init/start?appid=1&hash=8b2f3198fc67f49f5f1eece2cbc098b1&deviceid=172fe65995535e9670307f288722585&channel=appstore&height=1136&width=640" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        NSString * imageUrl =responseObject[@"result"][@"AppScreen"][@"Result"][@"Url"];
        
        NSString * path =[OKTools returnDocumentsPath];

        [OKDownloadManager downloadWithUrl:imageUrl filePath:path fileName:@"welcome.jpg" succeed:nil];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"welcome request err!");
    }];
}

#pragma mark - 定位
-(void)getLocation
{
//    OKLocationManager * manager =[OKLocationManager manager];
//    [manager location];
    
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];

    
    
}


//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [_locService stopUserLocationService];
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    [user setFloat:userLocation.location.coordinate.latitude forKey:@"lat"];
    [user setFloat:userLocation.location.coordinate.longitude forKey:@"lon"];
    [user synchronize];
    
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
    NSLog(@"location error \n %@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
