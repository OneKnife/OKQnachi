//
//  OKActivityFreeDetailController.m
//  Qunachi
//
//  Created by qianfeng on 15-5-2.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKActivityFreeDetailController.h"
#import "OKActivityFreeDetailModel.h"
#import "OKActivityFreeDetailTopCell.h"
#import "OKActivityFreeDetailCell.h"
#import "AFNetworking.h"

#define FREE_DETAIL_URL @"http://api.qunachi.com/v5.2.0/Act/Eat/detail?appid=1&hash=42380478d522ce46664922c94faf3002&deviceid=172fe65995535e9670307f288722585&channel=appstore&id=%@"

@interface OKActivityFreeDetailController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) OKActivityFreeDetailModel * model;

@end

@implementation OKActivityFreeDetailController
{
    UITableView * _tableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self requestData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)createTableView
{
    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else if(section==1)
    {
        return 1;
    }
    else if(section==2)
    {
        return self.model.Detail.count;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        OKActivityFreeDetailTopCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OKActivityFreeDetailTopCell"];
        if (!cell) {
            cell=[[NSBundle mainBundle]loadNibNamed:@"OKActivityFreeDetailTopCell" owner:nil options:nil].lastObject;
        }
        cell.model=self.model;
        return cell;
    }
    else if(indexPath.section==1)
    {
        OKActivityFreeDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OKActivityFreeDetailCell"];
        if (!cell) {

            cell=[[OKActivityFreeDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OKActivityFreeDetailCell"];
        }
        [cell setDetail:self.model.Summary andHeight:self.model.summaryHeight];
        return cell;
    }
    else if (indexPath.section==2)
    {
        OKActivityFreeDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"OKActivityFreeDetailCell"];
        if (!cell) {
            cell=[[OKActivityFreeDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"OKActivityFreeDetailCell"];
        }
        [cell setDetail:self.model.Detail[indexPath.row] andHeight:self.model.detailHeightArray[indexPath.row]];
        
        return cell;
    }
    
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 290;
    }
    else if(indexPath.section==1)
    {
        return self.model.summaryHeight.floatValue+4;
    }
    else if(indexPath.section==2)
    {
        return [self.model.detailHeightArray[indexPath.row] floatValue]+4;
    }
    return 0;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return nil;
    }
    else if (section==1) {
        return @"活动简介";
    }
    else if (section==2)
    {
        return @"活动详情";
    }
    return nil;
}


#pragma mark - 数据源

-(void)requestData
{
    if (!_model) {
         _model =[[OKActivityFreeDetailModel alloc] init];
    }
   
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET:[NSString stringWithFormat:FREE_DETAIL_URL,self.Id] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        

        _model.dict =responseObject[@"result"];
        [self performSelectorOnMainThread:@selector(createTableView) withObject:nil waitUntilDone:YES];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"free detail request err!");
    }];
    
}




@end
