//
//  OKFindShopHotShopViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-5-4.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFindShopHotShopViewController.h"
#import "AFNetworking.h"
#import "OKFindShopHotShopModel.h"
#import "OKFindShopHotShopCell.h"
#import "OKShopInfoViewController.h"

#define HOT_SHOP_URL @"http://api.qunachi.com/v5.2.0/Search/Shop/getShopList?appid=1&hash=8feef06577026d6fc9d0414fe106e062&deviceid=172fe65995535e9670307f288722585&channel=appstore"


@interface OKFindShopHotShopViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation OKFindShopHotShopViewController
{
    UITableView * _tableView;
    NSMutableArray * _dataArray;
    NSNumber * _cityId;
    NSNumber * _limit;
    NSNumber * _offset;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _limit=@(20);
    _offset=@(0);

    [self requestData];
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=_tips;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}

-(void)requestData
{
    if (!_dataArray) {
        _dataArray=[[NSMutableArray alloc]init];
        
        NSDictionary * para =@{@"cityid":@"2",
                               @"limit":_limit,
                               @"offset":_offset,
                               @"sort":@"4",
                               @"tips":_tips};
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];

        [manager POST:HOT_SHOP_URL parameters:para success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
            
            for (NSDictionary * itemDict in responseObject[@"result"][@"List"]) {
                OKFindShopHotShopModel * model =[[OKFindShopHotShopModel alloc]init];
                model.dict=itemDict;
                [_dataArray addObject:model];
            }
            
            if (!_tableView) {
                [self createTableView];

            }
            
            [_tableView reloadData];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"hot shop request err!");
        }];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKFindShopHotShopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OKFindShopHotShopCell"];
    
    if (!cell) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKFindShopHotShopCell" owner:nil options:nil].lastObject;
    }
    cell.model=_dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKShopInfoViewController * svc =[[OKShopInfoViewController alloc]init];
    
    svc.ShopId=[_dataArray[indexPath.row] ShopId];
    [self.navigationController pushViewController:svc animated:YES];
}


@end
