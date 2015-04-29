//
//  OKActivityFreeViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-29.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeViewController.h"
#include "OKActivityFreeCellTableViewCell.h"
#include "OKActivityFreeModel.h"
#import "AFNetworking.h"

#define FREE_URL @"http://api.qunachi.com/v5.2.0/Act/Eat/getList?appid=1&hash=4171cccab624735d169ba0ddf6b98b4a&deviceid=172fe65995535e9670307f288722585&channel=appstore&cid=2&limit=20&offset=0"

@interface OKActivityFreeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation OKActivityFreeViewController
{
    UITableView * _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor blackColor];
    [self createTableView];
}


-(void)createTableView
{
    _tableView =[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId =@"activityFreeCell";
    OKActivityFreeCellTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKActivityFreeCellTableViewCell" owner:nil options:nil].lastObject;
    }
    
    cell.model=self.dataArray[indexPath.row];
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - 数据源 

-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc] init];
        
        [self requestData];
    }
    
    return _dataArray;
}

-(void)requestData
{
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET:FREE_URL parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        for (NSDictionary * itemDict in responseObject[@"result"][@"List"]) {
            OKActivityFreeModel * model =[[OKActivityFreeModel alloc] init];
            model.dict=itemDict;
            [_dataArray addObject:model];
        }
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"free request err!");
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
