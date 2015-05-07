//
//  OKNearFriendViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-5-3.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKNearFriendViewController.h"
#import "AFNetworking.h"
#import "OKNearFriendModel.h"
#import "OKNearFriendCell.h"
#import "OKActivityWebViewController.h"
#import "OKShareFoodViewController.h"
#import "MJRefresh.h"

#define NEAR_FRIEND_URL @"http://api.qunachi.com/v5.2.0/Search/User/getNearUserList?appid=1&hash=a4eb64603e9f9a23f2e3c792518e3066&deviceid=172fe65995535e9670307f288722585&channel=appstore&lat=%f&limit=20&lng=%f&offset=%ld&sex=-1"

@interface OKNearFriendViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OKNearFriendViewController
{
    UITableView  * _tableView;
    NSMutableArray * _dataArray;
    NSInteger _offset;
    //1 表示是上拉加载，0表示下拉刷新
    BOOL _isUpTowordRefush;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
        [self createTableView];
//    [self requestData];
    
    
    [_tableView.header beginRefreshing];
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
 
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadDataWithDownTowords)];
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadDataWithUpTowords)];

    
    [self.view addSubview:_tableView];
}


-(void)requestData
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    
    NSUserDefaults * user =[NSUserDefaults standardUserDefaults];
    CGFloat lat = [user floatForKey:@"lat"];
    CGFloat lon = [user floatForKey:@"lon"];
    
    if (!lat) {
        
        UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"没有找到您的位置" message:@"请确认您的定位是否打开" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        [_tableView.header beginRefreshing];
        return;
    }
    
    
    [manager GET:[NSString stringWithFormat:NEAR_FRIEND_URL,lat,lon,_offset] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
      
        if (!_isUpTowordRefush) {
            [_dataArray removeAllObjects];
        }
        
        for (NSDictionary * itemDic in responseObject[@"result"][@"List"]) {
            OKNearFriendModel * model =[[OKNearFriendModel alloc] init];
            model.dict=itemDic;
            [_dataArray addObject:model];
        }
       

        
        [_tableView reloadData];
        [_tableView.header endRefreshing];
        [_tableView.footer endRefreshing];
//        [self performSelectorOnMainThread:@selector(createTableView) withObject:nil waitUntilDone:YES];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"request near friend err!");
    }];
}


#pragma mark  - tableView的代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OKNearFriendCell * cell =[tableView dequeueReusableCellWithIdentifier:@"OKNearFriendCell"];
    
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKNearFriendCell" owner:nil options:nil].lastObject;
    }
    
    cell.model=_dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[_dataArray[indexPath.row] LastAct] Type].intValue==3) {
        OKActivityWebViewController * web =[[OKActivityWebViewController alloc] init];
        web.url =[NSString stringWithFormat:@"http://m.qunachi.com/topic.php?id=%@",[[_dataArray[indexPath.row] LastAct] ItemId]];
        web.webView.frame=CGRectMake(0, -54, SCREEN_WIDTH, SCREEN_HEIGHT+60);
        [self.navigationController pushViewController:web animated:YES];
    }
    else if ([[_dataArray[indexPath.row] LastAct] Type].intValue==1) {
        OKShareFoodViewController * shareFood = [[OKShareFoodViewController alloc] init];
        shareFood.shareId=[[_dataArray[indexPath.row] LastAct] ItemId];
        [self.navigationController pushViewController:shareFood animated:YES];
    }
    else
    {
        UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"该用户没有推荐任何美食和探店" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        
        
        [alert show];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }
    
}

-(void)loadDataWithDownTowords
{
    _offset=0;
    _isUpTowordRefush=0;
    [self requestData];
}

-(void)loadDataWithUpTowords
{
    _isUpTowordRefush=1;
    
    _offset+=20;
    
    [self requestData];
}

@end
