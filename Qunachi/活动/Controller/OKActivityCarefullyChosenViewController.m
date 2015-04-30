//
//  OKActivityCarefullyChosenViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-28.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityCarefullyChosenViewController.h"
#import "OKActivityCarefullyChosenCell.h"
#import "OKActivityCarefullyChosenModel.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

#define LIST_URL @"http://api.qunachi.com/v5.2.0/Mobile/Feature/getList?appid=1&hash=acc2b424a4e5454279444a8ea38f2198&deviceid=172fe65995535e9670307f288722585&channel=appstore&cid=%d&limit=%d&offset=%ld&type=0"

//每页的条数
#define ITEM_EACH_PAGE 10

@interface OKActivityCarefullyChosenViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray * dataArray;

@end

@implementation OKActivityCarefullyChosenViewController
{
    UITableView * _tableView;
    NSInteger _currentPage;
    //是否是上拉刷新,YES表示上拉刷新
    BOOL _isUpLoad;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStylePlain];
    
    _tableView.delegate =self;
    
    _tableView.dataSource=self;
    
    [_tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(loadDataWithDownTowords)];
    [_tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(loadDataWithUpTowords)];
    
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId =@"careChoseCell";
    OKActivityCarefullyChosenCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKActivityCarefullyChosenCell" owner:nil options:nil].lastObject;
    }
    
//    NSLog(@"%d",indexPath.row);
    cell.model=self.dataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


#pragma mark - 数据源

-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc] init];
        [_tableView.header beginRefreshing];
    }
    
    return _dataArray;
}


-(void)requestData
{

    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    NSString * url = [NSString stringWithFormat:LIST_URL,2,ITEM_EACH_PAGE,_currentPage*ITEM_EACH_PAGE];
    
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        if (_isUpLoad) {
            [_tableView.footer endRefreshing];
        }
        else
        {
            [_dataArray removeAllObjects];
            [_tableView.header endRefreshing];
        }
        
        for (NSDictionary * itemDict in responseObject[@"result"][@"List"]) {
            OKActivityCarefullyChosenModel * model =[[OKActivityCarefullyChosenModel alloc] init];
            model.dict=itemDict;
            [_dataArray addObject:model];
        }
        
       
        [_tableView.header endRefreshing];

        [_tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"carefully choosen err!");
    }];
    
    
}

-(void)loadDataWithDownTowords
{
    _isUpLoad=NO;
    _currentPage=0;
    [self requestData];
    
}
-(void)loadDataWithUpTowords
{
    _isUpLoad=YES;
    _currentPage++;
    
    if (_currentPage<2) {
        [self requestData];
    }
    else
    {
        [_tableView.footer noticeNoMoreData];
    }
    
}

@end
