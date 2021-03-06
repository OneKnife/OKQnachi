//
//  OKFindShopViewController.m
//  Qunachi
//
//  Created by qianfeng on 15-4-27.
//  Copyright (c) 2015年 zyc. All rights reserved.
//

#import "OKFindShopViewController.h"
#import "AFNetworking.h"
#import "OKFindShopModel.h"
#import "OKShopInfoViewController.h"
#import "OKFindShopHotShopViewController.h"


#define FIND_SHOP_URL @"http://api.qunachi.com/v5.2.0/Search/Shop/getSuggestList?appid=1&hash=9c9777bffa23dc6778721885d1e34ea1&deviceid=172fe65995535e9670307f288722585&channel=appstore&cityid=2&keyword=%@"

@interface OKFindShopViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation OKFindShopViewController
{
    NSMutableArray * _dataArray;
    UISearchBar * _searchBar;
    UITableView * _searchTableView;
    NSString * _searchText;
    //tip名
    NSArray * _tipsArray;
    NSTimer * _timer;
    NSMutableArray * _tipsButtonArray;
    
    //显示推荐
    UIView * _tipsView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self customNavBar];
    [self createSearchTableView];
    [self createTipsView];
    
    self.title=@"";
    
}

#pragma mark - navBar相关
-(void)customNavBar
{
    [self createSearchBar];
    [self createRightButton];
}

-(void)createSearchBar
{
    _searchBar =[[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-100, 30)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:_searchBar];
    _searchBar.delegate=self;
    
}

-(void)createRightButton
{
    UIButton * rightButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightButton setTitle:@"取消" forState:UIControlStateNormal];
    [rightButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [rightButton addTarget:self action:@selector(rightBarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
}

-(void)rightBarButtonClick
{
    [_searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_searchBar resignFirstResponder];
}



#pragma mark - 创建tableView

-(void)createSearchTableView
{
    _dataArray=[[NSMutableArray alloc] init];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _searchTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    
    _searchTableView.delegate=self;
    _searchTableView.dataSource=self;
    
    
    [self.view addSubview:_searchTableView];
}


#pragma mark - searchBar 代理

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //  NSLog(@"%@",[);
    _searchText=searchText;
    
    

    
    NSString * url =[[NSString stringWithFormat:FIND_SHOP_URL,searchText] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    [manager GET: url parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary * responseObject) {
        
        [_dataArray removeAllObjects];
        for (NSDictionary * item in responseObject[@"result"][@"List"]) {
            OKFindShopModel * model =[[OKFindShopModel alloc] init];
            [model setValuesForKeysWithDictionary:item];
            [_dataArray addObject:model];
        }
        
        [_searchTableView reloadData];
        
        if (_dataArray.count==0) {
            _tipsView.hidden=NO;
        }
        else
        {
            _tipsView.hidden=YES;
        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"search Shop err!");
    }];
}


#pragma  mark - tableView 代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId = @"findShopCell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.textLabel.text=[_dataArray[indexPath.row] ShopName];
    cell.detailTextLabel.text=[_dataArray[indexPath.row] Address];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * title =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    if (_searchText.length) {
        title.text=[NSString stringWithFormat:@"查找\"%@\"",_searchText];
        title.textColor=[UIColor orangeColor];
    }
    else
    {
         title.text=@"";
    }
    

    return title;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [_searchBar resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OKShopInfoViewController * shopInfoController =[[OKShopInfoViewController alloc] init];
    
    shopInfoController.ShopId=[_dataArray[indexPath.row] ShopId];
    shopInfoController.view.frame=self.view.frame;
    
    [self.navigationController pushViewController:shopInfoController animated:YES];
    
}


-(void)createTipsView
{
    
    
    _tipsView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tipsView.userInteractionEnabled=YES;
    _tipsView.backgroundColor=[UIColor whiteColor];
    _tipsArray= @[@"情侣约会",
                  @"朋友聚餐",
                  @"家庭聚会",
                  @"商务宴请",
                  @"休闲小憩",
                  @"随便吃吃"];
    
    _tipsButtonArray =[[NSMutableArray alloc] init];
    
    
    for (NSInteger i =0; i<2;i++) {
        for (NSInteger j =0; j<3; j++) {
            UIButton * button =[[UIButton alloc] initWithFrame:CGRectMake(0,0, 70, 20)];
            button.center =CGPointMake(SCREEN_WIDTH/4*(j+1)-10, 40*(i+1)+10);
            
            [button setTitle:_tipsArray[i*3+j] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font=[UIFont systemFontOfSize:12];
            button.layer.masksToBounds=YES;
            button.layer.cornerRadius=5;
            button.layer.borderColor=[UIColor blackColor].CGColor;
            button.layer.borderWidth=1;
            button.alpha=0.1;
            button.tag=i*3+j;
            [button addTarget:self action:@selector(tipsOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [_tipsView addSubview:button];
            [_tipsButtonArray addObject:button];
        }
    }
    
    
    [self.view addSubview:_tipsView];
    [self createTimer];
    
}

-(void)createTimer
{
    _timer =[NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
    _timer.fireDate=[NSDate distantFuture];
    _timer.fireDate=[NSDate distantPast];
}

-(void)timerClick
{
    for (UIButton * button in _tipsButtonArray) {
        [UIView animateWithDuration:0.5 animations:^{
   
            
            button.alpha=0.1;
            CGRect frame = button.frame;
            frame.origin.x-=5;
            frame.origin.y+=5;
            button.frame=frame;

        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                button.alpha=1;
                CGRect frame = button.frame;
                frame.origin.x+=5;
                frame.origin.y-=5;
                button.frame=frame;
            }];
        }];
    }

    
}

-(void)tipsOnClick:(UIButton *)button
{
//    _searchBar.text=_tipsArray[button.tag];
    
    OKFindShopHotShopViewController * hotShop =[[OKFindShopHotShopViewController alloc] init];
    hotShop.tips=_tipsArray[button.tag];
    [self.navigationController pushViewController:hotShop animated:YES];
}


@end
