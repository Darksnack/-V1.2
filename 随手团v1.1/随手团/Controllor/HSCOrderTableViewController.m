//
//  HSCOrderTableViewController.m
//  团队随手团
//
//  Created by 贺世昌 on 15/11/10.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCOrderTableViewController.h"
#import "HSCOrderDetailsViewController.h"
#import "HSCTableViewCell.h"
#import "Reachability.h"
#import "MJRefresh.h"
#import "SVProgressHUD.h"
#import "WPShopVIewController.h"
@interface HSCOrderTableViewController ()<UITableViewDataSource,UITableViewDelegate, HSCTableViewCellDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *informationArray;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray * arr;

@end

@implementation HSCOrderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [NSMutableArray arrayWithCapacity:0];
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    
    self.navigationItem.title = @"订单";
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    [self setUpView];
   dispatch_async(dispatch_get_main_queue(), ^{
       [self setUpData];
   });
    
    [SVProgressHUD showWithStatus:@"正在玩命的加载..." maskType:SVProgressHUDMaskTypeBlack];
    
}
- (void)setUpView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.rowHeight = 110;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_dataArray removeAllObjects];
        [self setUpData];
        [self.tableView reloadData];
        [self.tableView.header endRefreshing];
    }];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self addData:_dataArray.count];
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    }];
    
}
- (void)setUpData{
    
    NSString *str =@"http://101.200.160.247:8080/info/index.txt";
   
    _arr = [self analysisDownData:str];
    NSLog(@"%@",_arr);
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
        [_tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuse = @"reuseIdentifier";
    HSCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[HSCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    
        cell.delegate = self;
    }
    NSLog(@"%ld",_dataArray.count);
//    dispatch_queue_t queue;
//    dispatch_async(queue, ^{
//        [cell tabelViewCellData:_dataArray[indexPath.section]];
//    });
    [cell tabelViewCellData:_dataArray[indexPath.section]];
    
   
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
    
}

#pragma mark -- HSCTableViewCellDelegate
- (void)clickDownViewInCell:(NSString *)str{
    HSCOrderDetailsViewController *OrderDWtails = [[HSCOrderDetailsViewController alloc] init];
    [self.navigationController pushViewController:OrderDWtails animated:YES];
}
- (void)clickUpViewInCell{
    WPShopVIewController *shop = [[WPShopVIewController alloc] init];
    [self.navigationController pushViewController:shop animated:YES];

}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    HSCOrderDetailsViewController *OrderDWtails = [[HSCOrderDetailsViewController alloc] init];
//    [self.navigationController pushViewController:OrderDWtails animated:YES];
//
//}

@end
