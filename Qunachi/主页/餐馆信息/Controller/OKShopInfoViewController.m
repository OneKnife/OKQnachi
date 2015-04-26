//
//  OKShopInfoViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-26.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKShopInfoViewController.h"
#import "OKShopInfoModel.h"
#import "AFNetworking.h"


#define SHOP_INFO_URL @"http://api.qunachi.com/v5.2.0/Pai/Shop/info?appid=1&hash=719467a7a9d6d139213196573c7afb8b&deviceid=172fe65995535e9670307f288722585&channel=appstore&shopid=%ld"

@interface OKShopInfoViewController ()

@property (nonatomic,strong) OKShopInfoModel * model;

@end

@implementation OKShopInfoViewController
{
    UITableView * _tableView;
    OKShopInfoModel * _model;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

-(void)createTableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-108) style:UITableViewStyleGrouped];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(OKShopInfoModel *)model
{
    if (_model==nil) {
        _model=[[OKShopInfoModel alloc] init];
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
        
        [manager GET:[NSString stringWithFormat:SHOP_INFO_URL,self.shopid] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            _model =[[OKShopInfoModel alloc] init];
            _model.dict=responseObject[@"result"];
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"shop info request err!");
        }];
       
    }
    
    return _model;
}



@end
