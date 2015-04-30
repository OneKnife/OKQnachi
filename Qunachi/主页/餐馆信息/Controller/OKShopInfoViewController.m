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
#import "OKShopInfoSection1Row1Cell.h"
#import "OKShopInfoTipsCell.h"
#import "OKShopInfoShareListTableViewCell.h"
#import "OKHomeInfoImageViewController.h"
#import "OKShareFoodViewController.h"

#define SHOP_INFO_URL @"http://api.qunachi.com/v5.2.0/Pai/Shop/info?appid=1&hash=719467a7a9d6d139213196573c7afb8b&deviceid=172fe65995535e9670307f288722585&channel=appstore&shopid=%@"

@interface OKShopInfoViewController ()<UITableViewDataSource,UITableViewDelegate,OKShopInfoSection1Delegate,OKShopInfoShareListDelegate,UIAlertViewDelegate>

@property (nonatomic,strong) OKShopInfoModel * model;

@end

@implementation OKShopInfoViewController
{
    UITableView * _tableView;
    OKShopInfoModel * _model;
    
    NSNumber * _phoneNum;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    [self model];
}

#pragma mark - tableView
-(void)createTableView
{
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }
    
    else if(section==1)
    {
        if (self.model.Tags.count!=0) {
            return 1;
        }
    }
    else if (section==2)
    {
        if ([self.model.RecommendVipName isEqualToString:@""]) {
            return 0;
        }
        else
        {
            return 1;
        }
    }
    
    else if (section==3)
    {
        
        return self.model.ShareList.count/3;

    }
    return 0;
    
        
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        static NSString * cell1Id=@"shopInfoCell1";
        OKShopInfoSection1Row1Cell * cell = [tableView dequeueReusableCellWithIdentifier:cell1Id];
        if (cell==nil) {
            cell=[[NSBundle mainBundle] loadNibNamed:@"OKShopInfoSection1Row1Cell" owner:nil options:nil].lastObject;
            cell.delegate=self;
        }
        cell.model=self.model;
        return cell;
    }
    
    else if (indexPath.section==1)
    {
        static NSString * cell2Id=@"shopInfoTipsCell";
        OKShopInfoTipsCell * cell= [tableView dequeueReusableCellWithIdentifier:cell2Id];
        if (cell==nil) {
           
        cell =[[NSBundle mainBundle] loadNibNamed:@"OKShopInfoTipsCell" owner:nil options:nil].lastObject;
            
        }
        cell.tipsArray=self.model.Tips;
        
        return cell;
    }
    else if (indexPath.section==2)
    {
        UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell==nil) {
            cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        
        cell.imageView.image =[UIImage imageNamed:@"icon_heart_orange"];
        cell.textLabel.text=[NSString stringWithFormat:@"\"%@\"等美食地主推荐", self.model.RecommendVipName];
        cell.textLabel.font=[UIFont systemFontOfSize:13];
        return cell;
    }
    else if(indexPath.section==3)
    {
        
        static NSString * cellId = @"shareListCell";
        OKShopInfoShareListTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell==nil) {
            cell=[[NSBundle mainBundle] loadNibNamed:@"OKShopInfoShareListTableViewCell" owner:nil options:nil].lastObject;
            cell.delegate=self;
            
        }
        
        [cell setdataWithModel1:self.model.ShareList[indexPath.row*3] model2:self.model.ShareList[indexPath.row*3+1] model3:self.model.ShareList[indexPath.row*3+2]];
        
        return cell;

    }
    
    
    return nil;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(OKShopInfoModel *)model
{
    if (_model==nil) {
        _model=[[OKShopInfoModel alloc] init];
        
        AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
        
        NSLog(@"%@",self.ShopId);
        [manager GET:[NSString stringWithFormat:SHOP_INFO_URL,self.ShopId] parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            _model =[[OKShopInfoModel alloc] init];
            _model.dict=responseObject[@"result"];
            
            [_tableView reloadData];
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"shop info request err!");
        }];
       
    }
    
    return _model;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 232;
    }
    else if (indexPath.section==1)
    {
        return 50;
    }
    else if (indexPath.section==2)
    {
        return 44;
    }
    else if (indexPath.section==3)
    {
        return 115;
    }
    else
        return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==3) {
        return [NSString stringWithFormat:@"%ld道美食",self.model.ShareList.count];
    }
    else
        return nil;
}


#pragma mark - 点击图片的回调响应函数

-(void)imageClick
{
    OKHomeInfoImageViewController * vc =[[OKHomeInfoImageViewController alloc] init];
    vc.array=_model.Images;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)phoneClickWithPhoneNumber:(NSArray *)numArray
{
    if (numArray.count>0) {
        NSLog(@"%@",[NSString stringWithFormat:@"%@",numArray[0]]);
    UIAlertView * alert =[[UIAlertView alloc] initWithTitle:@"联系饭店" message:nil delegate:self cancelButtonTitle:@"改天再说" otherButtonTitles:[NSString stringWithFormat:@"%@",numArray[0]], nil];
    _phoneNum=numArray[0];

    [alert show];

    }
    else
    {
        UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"该商户暂未提供电话" message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert show];
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }
    
    
}


-(void)shareListImageClick:(OKShopInfoShareListModel *)model
{
    OKShareFoodViewController * svc =[[OKShareFoodViewController alloc] init];
    
    svc.shareId=model.ShareId;
    

    
    [self.navigationController pushViewController:svc animated:YES];
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_phoneNum]]];
    }
}

@end
