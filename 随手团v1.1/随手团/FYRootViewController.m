//
//  FYRootViewController.m
//  外卖
//
//  Created by 艾尔 on 15/11/11.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYRootViewController.h"
#import "FYNavButton.h"
#import "FYFirstView.h"
#import "FYPositionViewController.h"
#import "FYAdvertisementScrollView.h"
#import "FYSearchShopViewController.h"
#import "FYFunctionView.h"
#import "FYActivityView.h"
#import "HSCTableViewCell.h"
#import "SVProgressHUD.h"
#import "MJRefresh.h"

@interface FYRootViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>{
    UIView *view;
    FYActivityView *activityView;
    FYAdvertisementScrollView *advertisemetScrollView;
    FYFunctionView *functionView;
    UITableView *tableView;
    UIButton *searchShopBtn;
    FYNavButton *btn;
}
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSArray *informationArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray * arr;
@end

@implementation FYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    _dataArray = [NSMutableArray arrayWithCapacity:1];
    // Do any additional setup after loading the view.
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setUpData];
    });
    
    [SVProgressHUD showWithStatus:@"正在玩命的加载..." maskType:SVProgressHUDMaskTypeBlack];
    
}

- (void)setUpView{
    
    tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, statusBarFrame.size.height+navigationBarFrame.size.height)];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    btn = [[FYNavButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-150)/2, navigationBarFrame.origin.y, 150, 44)];
    [btn addTarget:self action:@selector(changeSite) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    searchShopBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-44, 0, 44, 64)];
    [searchShopBtn setImage:[UIImage imageNamed:@"appproduct_searchicon.png"] forState:UIControlStateNormal];
    [searchShopBtn addTarget:self action:@selector(goToSearchShopVC:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:searchShopBtn];
    
    advertisemetScrollView = [[FYAdvertisementScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/4+60)];
    //[tableView addSubview:advertisemetScrollView];
    
    functionView = [[FYFunctionView alloc] initWithFrame:CGRectMake(0, -50, self.view.frame.size.width, self.view.frame.size.height/4)];
    //[tableView addSubview:functionView];
    [functionView setGotoFunctionDetailVC:^(FYFunctionDetailViewController *functionVC) {
        [self.navigationController pushViewController:functionVC animated:YES];
    }];
    
    activityView = [[FYActivityView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height/4+60)];
    //[tableView addSubview:activityView];
//    tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [_dataArray removeAllObjects];
//        [self setUpData];
//        [tableView reloadData];
//        [tableView.header endRefreshing];
//    }];
    tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self addData:_dataArray.count];
        [tableView reloadData];
        [tableView.footer endRefreshing];
    }];
    
}
- (void)setUpData{
    
    NSString *str =@"http://101.200.160.247:8080/info/index.txt";
    
    _arr = [self analysisDownData:str];
    //NSLog(@"%@",_arr);
    if (_arr.count < 2) {
        return;
    }
    _informationArray = [self analysisDownData:_arr[1]];
    NSLog(@"%@",_informationArray);
    _imageArray = [self analysisDownData:_arr[2]];
    NSLog(@"%@",_imageArray);
    [self addData:_dataArray.count];
    
    
    
    
}
#pragma mark -- 上拉加载数据
- (void)addData:(NSInteger)page{
    
    for ( NSInteger i= 0; i<5; i++) {
        if ((page+i) < [_arr[0] integerValue]) {
            NSArray *shopInformationArray = [self  analysisDownData:_informationArray[page+i]];
            NSURL *imageUrl = [NSURL URLWithString:_imageArray[page+i]];
            NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *image = [UIImage imageWithData:imageData];
            HSCShopModel *model = [HSCShopModel creatModelWithArray:shopInformationArray];
            [model setFoodImage:image];
            [_dataArray addObject:model];
        }
        
    }

    if (_dataArray.count >0) {
        [tableView reloadData];
    }
    [SVProgressHUD dismiss];
}
#pragma mark -- 解析数据
- (NSArray *)analysisDownData:(NSString *)str{
    NSURL *url = [NSURL URLWithString:str];
    NSData * data = [NSData dataWithContentsOfURL:url];
    //NSLog(@"%@",data);
    NSString *dataStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSArray * arr = [dataStr componentsSeparatedByString:@"#"];
    return arr;
}

- (void)goToSearchShopVC:(UIButton *)sender{
    FYSearchShopViewController *searchShopVC = [[FYSearchShopViewController alloc] init];
    [self.navigationController pushViewController:searchShopVC animated:YES];
    
}

- (void)changeSite{
    FYPositionViewController *positionVC = [[FYPositionViewController alloc] init];
    [self.navigationController pushViewController:positionVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    
//    
//    
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<3) {
        return self.view.frame.size.height/4+60;
    }
    else{
        return 110;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  2+_dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section>0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    else{
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    if (indexPath.row==2) {
        
        cell.backgroundView = activityView;
        
    }
    if (indexPath.row==1) {
        
        cell.backgroundView = functionView;
        
    }
    if (indexPath.row==0) {
        
        cell.backgroundView = advertisemetScrollView;
        
    }
    
    if (indexPath.row>2) {
        static NSString *reuse = @"reuseIdentifier";
        HSCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
        if (!cell) {
            cell = [[HSCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
            
          
        }
        NSLog(@"%ld",_dataArray.count);
        //    dispatch_queue_t queue;
        //    dispatch_async(queue, ^{
        //        [cell tabelViewCellData:_dataArray[indexPath.section]];
        //    });
        [cell tabelViewCellData:_dataArray[indexPath.row-2]];
        cell.tmpLabel.text = @"商家";
        return cell;
    }
    
    return cell;
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

    if (scrollView.contentOffset.y>-20) {
        btn.alpha = 0;
        searchShopBtn.alpha = 0;
    }
    else{
        btn.alpha = 1;
        searchShopBtn.alpha = 1;
    }
    
}
@end
