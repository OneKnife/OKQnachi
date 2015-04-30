//
//  OKHomeDetailViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-30.
//  Copyright (c) 2015年 zyc. All rights reserved.
//



#import "OKHomeDetailViewController.h"
#import "AFNetworking.h"
#import "OKHomeDetailModel.h"
#import "OKHomeDetailCell.h"
#import "OKHomeDetailCommentCell.h"
#import "OKShopInfoViewController.h"

#define HOME_DETAIL_URL @"http://api.qunachi.com/v5.2.0/Social/Dating/detail?appid=1&hash=aa12d53db4ce81fd5271c8176bd9f684&deviceid=172fe65995535e9670307f288722585&channel=appstore&datingid=%@"

@interface OKHomeDetailViewController ()<UITableViewDataSource,UITableViewDelegate,OKHomeDetailModelDelegate>

@end

@implementation OKHomeDetailViewController
{
    OKHomeDetailModel * _model;
    UITableView * _tableView;
}

-(instancetype)init
{
    if (self=[super init]) {
        _model = [[OKHomeDetailModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self createTableView];
    [self requestData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(void)requestData
{
    NSLog(@"%@",[NSString stringWithFormat:HOME_DETAIL_URL,_datingId]);
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:HOME_DETAIL_URL,_datingId] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        

        _model.dict = responseObject[@"result"];
        
        [_tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"home detail request err!");
    }];
}

#pragma mark - tableView的回调

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if (section==1) {
        return _model.Comment.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        static NSString * cellId =@"detailCell";
        OKHomeDetailCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell==nil) {
            cell=[[NSBundle mainBundle]loadNibNamed:@"OKHomeDetailCell" owner:nil options:nil].lastObject;
        }
        cell.model=_model;
        cell.delegate=self;
        return cell;
    }
    else if(indexPath.section==1)
    {
        static NSString * cellId =@"detailCommentCell";
        OKHomeDetailCommentCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell==nil) {
            cell=[[NSBundle mainBundle]loadNibNamed:@"OKHomeDetailCommentCell" owner:nil options:nil].lastObject;
        }
        cell.model=_model.Comment[indexPath.row];
        return cell;

    }
    return nil;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 214;
    }
    else
    {
        return 95;
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return @"所有评论";
    }
    return nil;
}

-(void)jumpShopInfoControllerWithshopId:(NSNumber *)shopId
{
    OKShopInfoViewController * shopInfo =[[OKShopInfoViewController alloc]init];
    shopInfo.ShopId=shopId;
    [self.navigationController pushViewController:shopInfo animated:YES];
    
}

@end
