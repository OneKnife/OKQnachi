//
//  OKFindFriendViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-22.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFindFriendViewController.h"
#import "AFNetworking.h"
#import "OKFindFriendModel.h"
#import "OKFindFriendCell.h"
#import "OKFriendViewController.h"

#define FIND_FRIEND_URL @"http://api.qunachi.com/v5.2.0/Search/User/getUserList?appid=1&hash=635434339168bdfa52661e52430ad33f&deviceid=172fe65995535e9670307f288722585&channel=appstore&keyword=%@&limit=50&offset=0"





@interface OKFindFriendViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation OKFindFriendViewController
{
    UISearchBar * _searchBar;
    NSMutableArray * _dataArray;
    UITableView * _searchTableView;
//    NSArray * _tipsArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSearchBar];
    [self createSearchTableView];

    
}

-(void)createSearchBar
{

    
    _dataArray = [[NSMutableArray alloc] init];
    
    _searchBar =[[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 41)];
    
    _searchBar.delegate =self;
    _searchBar.placeholder=@"搜索吃友";
    [self.view addSubview:_searchBar];
    
}


-(void)createSearchTableView
{
    _searchTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 105, SCREEN_WIDTH, SCREEN_HEIGHT-149) style:UITableViewStylePlain];
    
    _searchTableView.delegate=self;
    _searchTableView.dataSource=self;
    [self.view addSubview:_searchTableView];
}



#pragma mark - searchBar 代理

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
  //  NSLog(@"%@",[);
    
    NSString * url =[[NSString stringWithFormat:FIND_FRIEND_URL,searchText] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET: url parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        [_dataArray removeAllObjects];
        for (NSDictionary * item in responseObject[@"result"][@"List"]) {
            OKFindFriendModel * model =[[OKFindFriendModel alloc] init];
            [model setValuesForKeysWithDictionary:item];
            [_dataArray addObject:model];
        }
        
        [_searchTableView reloadData];
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"search Friend err!");
    }];
}


#pragma  mark - tableView 代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"findFriendCell";
    OKFindFriendCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKFindFriendCell" owner:nil options:nil].lastObject;
    }
    
    cell.model=_dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_searchBar resignFirstResponder];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKFriendViewController * friendVC =[[OKFriendViewController alloc] initWithNibName:@"OKFriendViewController" bundle:nil];
    friendVC.uid=[_dataArray[indexPath.row] UserId];
    [self.navigationController pushViewController:friendVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
}








@end
