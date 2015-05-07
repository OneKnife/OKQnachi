//
//  OKShareFoodViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShareFoodViewController.h"
#import "OKShopShareFoodModel.h"
#import "OKShopShareFoodSection1row1Cell.h"
#import "OKShareFoodCommentCell.h"
#import "OKShopShareFoodCommentModel.h"
#import "AFNetworking.h"

#define SHARE_FOOD_URL @"http://api.qunachi.com/v5.2.0/Pai/Share/detail?appid=1&hash=970113c70048e759efb044bbe81db2c8&deviceid=172fe65995535e9670307f288722585&channel=appstore&id=%@"

@interface OKShareFoodViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)  OKShopShareFoodModel * model;

@end

@implementation OKShareFoodViewController
{
    UITableView * _tableView;
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self model];
    self.view.backgroundColor=[UIColor whiteColor];
}

-(void)createTableView
{
    self.automaticallyAdjustsScrollViewInsets=NO;
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    _tableView.contentInset=UIEdgeInsetsMake(0, 0, 100, 0);
    
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }
    else if(section==1)
    {
        NSLog(@"%ld",self.model.Comment.count);
        return self.model.Comment.count;
        
    }
    return 0;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            static NSString * cellId=@"shareFoodCell";
            OKShopShareFoodSection1row1Cell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
            
            if (cell==nil) {
                cell =[[NSBundle mainBundle]loadNibNamed:@"OKShopShareFoodSection1row1Cell" owner:nil options:nil].lastObject;
            }
            cell.model=self.model;
            
            return cell;
        }
        
        if (indexPath.row==1) {
            static NSString * cellId=@"shareFoodSection1Row2";
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
            
            if (cell==nil) {
                cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
                cell.imageView.image=[UIImage imageNamed:@"address_ico"];
            }
            cell.textLabel.text=self.model.ShopName;
            cell.textLabel.font=[UIFont systemFontOfSize:12];
            cell.detailTextLabel.text=self.model.Address;
            cell.detailTextLabel.font=[UIFont systemFontOfSize:10];
            cell.detailTextLabel.textColor=[UIColor lightGrayColor];
            return cell;

        }
        if (indexPath.row==2) {
            static NSString * cellId=@"shareFoodSection1Row3";
            UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
            
            if (cell==nil) {
                cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
                cell.imageView.image=[UIImage imageNamed:@"eatry_phone"];
            }
            
            NSMutableString * phoneStr = [[NSMutableString alloc] init];
            for (NSString * phoneItem in self.model.Phone) {
                [phoneStr appendFormat:@"%@ ",phoneItem];
            }
            cell.textLabel.text=phoneStr;
            cell.textLabel.font=[UIFont systemFontOfSize:12];
            
            return cell;
        }
    }
    
    if (indexPath.section==1) {
        static NSString * cellId =@"shareCommentCell";
        OKShareFoodCommentCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell==nil) {
            cell=[[NSBundle mainBundle]loadNibNamed:@"OKShareFoodCommentCell" owner:nil options:nil].lastObject;
        }
        cell.model=self.model.Comment[indexPath.row];
        return cell;
    }

    return nil;
    
}

-(OKShopShareFoodModel *)model
{
    if (_model==nil) {
        _model=[[OKShopShareFoodModel alloc] init];
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
        
        [manager GET:[NSString stringWithFormat:SHARE_FOOD_URL,_shareId] parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
            
            _model.dict=responseObject[@"result"];
            
            if (!_tableView) {
                 [self createTableView];
            }
            [_tableView reloadData];
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"share food request err!");
        }];
    }
    
    return _model;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return _model.cellHeight;
        }
        if (indexPath.row==1) {
            return 44;
        }
        if (indexPath.row==2) {
            return 44;
        }
    }
    if (indexPath.section==1) {
        OKShopShareFoodCommentModel * model = _model.Comment[indexPath.row];
        NSLog(@"%f",model.cellHeight);
        return model.cellHeight;
    }
    return 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
