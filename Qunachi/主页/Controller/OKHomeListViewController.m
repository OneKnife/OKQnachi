//
//  OKHomeListViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-24.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKHomeListViewController.h"
#import "OKHomeListTableViewCell.h"
#import "OKHomeDetailViewController.h"

@interface OKHomeListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end


@implementation OKHomeListViewController
{
    UITableView * _tableView;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createTableView];
    
    self.navigationController.navigationBar.barTintColor=[UIColor orangeColor];
    
    self.title=@"列表";
    
}
-(void)setListModelArray:(NSMutableArray *)listModelArray
{
    _listModelArray = listModelArray;
    
    [_tableView reloadData];
}


-(void)createTableView
{
    
        self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-104) style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.rowHeight=210;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor=[UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:1];
    [self.view addSubview:_tableView];
    
}


-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listModelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId =@"OKHomeListCell";
    OKHomeListTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[NSBundle mainBundle]loadNibNamed:@"OKHomeListTableViewCell" owner:nil options:nil].lastObject;
    }
    
    cell.model=self.listModelArray[indexPath.row];
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKHomeDetailViewController * dvc =[[OKHomeDetailViewController alloc] init];
    dvc.datingId = [self.listModelArray[indexPath.row] DatingId];
    [self.navigationController pushViewController:dvc animated:YES];
}





@end
