//
//  FYSearchShopViewController.m
//  外卖
//
//  Created by 艾尔 on 15/11/11.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYSearchShopViewController.h"

@interface FYSearchShopViewController ()<UIScrollViewDelegate>

@end

@implementation FYSearchShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
}

- (void)setUpView{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, statusBarFrame.size.height+navigationBarFrame.size.height)];
    view.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, statusBarFrame.size.height+navigationBarFrame.size.height)];
    backBtn.backgroundColor = [UIColor clearColor];
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backVC) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(backBtn.frame.origin.x+backBtn.frame.size.width+5, statusBarFrame.size.height+statusBarFrame.origin.y, self.view.frame.size.width-backBtn.frame.origin.x-backBtn.frame.size.width, navigationBarFrame.size.height)];
    [searchBar setPlaceholder:@"请输入商品名、商家名"];
    [searchBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background.png"]];
    [view addSubview:searchBar];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, view.frame.size.height+view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tableView];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50/2, 30, self.view.frame.size.width-50, 200)];
    view1.backgroundColor = [UIColor whiteColor];
    [tableView addSubview:view1];
}

- (void)backVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
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

@end
