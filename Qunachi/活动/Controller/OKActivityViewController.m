//
//  OKActivityViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityViewController.h"
#import "ZYCBanner.h"
#import "AFNetworking.h"
#import "OKActivityBannerModel.h"
#import "OKActivityWebViewController.h"
#import "OKActivityCarefullyChosenViewController.h"
#import "OKActivityFreeViewController.h"

#define ACTIVITY_BANNER_URL @"http://api.qunachi.com/v5.2.0/Home/Index/getCarousel?appid=1&hash=a189f26a3a1ddf4bae8c30c5da0d88c6&deviceid=172fe65995535e9670307f288722585&channel=appstore&cityid=%d"

@interface OKActivityViewController ()<UITableViewDataSource,UITableViewDelegate,ZYCBannerDelegate>

@property (nonatomic,strong) NSMutableArray * bannerDataArray;
@end

@implementation OKActivityViewController
{
    UITableView * _tableView;
    ZYCBanner * _banner;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    
    [self createTableHearderView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:1];
    
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if (section==1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID =@"activityCell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section==0) {
       if (indexPath.row==0) {
            cell.textLabel.text=@"精选";
            cell.imageView.image=[UIImage imageNamed:@"tchms_ico"];
        }
        
    }
    else if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"免费试吃";
            cell.imageView.image=[UIImage imageNamed:@"ico_yuefan"];

        }
        else if (indexPath.row==1) {
            cell.textLabel.text=@"预留栏位";
            cell.imageView.image=[UIImage imageNamed:@"mfsch_ico"];
        }
    }
//    else if (indexPath.section==2) {
//        
//    }

    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            
            OKActivityCarefullyChosenViewController * avc =[[OKActivityCarefullyChosenViewController alloc] init];
            [self.navigationController pushViewController:avc animated:YES];
            
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            OKActivityFreeViewController * afvc =[OKActivityFreeViewController alloc];
            [self.navigationController pushViewController:afvc animated:YES];
            
        }
    }
    
    
}

#pragma mark - hearderView

-(void)createTableHearderView
{
    _banner= [[ZYCBanner alloc] init];
    
    _banner.delegate=self;
    _banner.modelArray=self.bannerDataArray;
    _tableView.tableHeaderView=_banner;
}


#pragma mark - banner数据源

-(NSMutableArray *)bannerDataArray
{
    if (_bannerDataArray==nil) {
        _bannerDataArray = [[NSMutableArray alloc] init];
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
        
        [manager GET:[NSString stringWithFormat:ACTIVITY_BANNER_URL,2] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
            
            for (NSDictionary * itemDict in responseObject[@"result"][@"Carousel"]) {
                OKActivityBannerModel * model = [[OKActivityBannerModel alloc] init];
                [model setValuesForKeysWithDictionary:itemDict];
                
                [_bannerDataArray addObject:model];
            }
            
            _banner.modelArray=_bannerDataArray;
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"activity request err!");
        }];
        
        
    }
    
    
    return _bannerDataArray;
}

-(void)bannerOnclickWithUrl:(NSString *)url
{
    NSLog(@"%@",url);
    OKActivityWebViewController * web =[[OKActivityWebViewController alloc] init];
    
    web.url=url;
    [self.navigationController pushViewController:web animated:YES];
    
}




@end
