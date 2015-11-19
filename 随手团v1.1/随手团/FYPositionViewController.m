//
//  FYPositionViewController.m
//  外卖
//
//  Created by 艾尔 on 15/11/10.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYPositionViewController.h"

@interface FYPositionViewController ()

@end

@implementation FYPositionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self setUpView];
}

- (void)setUpView{
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, statusBarFrame.size.height+navigationBarFrame.size.height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, statusBarFrame.size.height+navigationBarFrame.size.height)];
    backBtn.backgroundColor = [UIColor whiteColor];
    [backBtn addTarget:self action:@selector(backVCAndPosition:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"btn_backItem.png"] forState:UIControlStateNormal];
    [view addSubview:backBtn];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-56)/2, 0, 100, backBtn.frame.size.height)];
    label.text = @"切换地址";
    [view addSubview:label];
    
    //搜索栏
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, statusBarFrame.size.height+navigationBarFrame.size.height-1, self.view.frame.size.width, 44)];
    [searchBar setPlaceholder:@"输入地址搜索周边商家"];
    [self.view addSubview:searchBar];
    
    //表视图
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, searchBar.frame.size.height+searchBar.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height-statusBarFrame.size.height-navigationBarFrame.size.height-searchBar.frame.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    [self.view addSubview:tableView];
    
    //定位按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, tableView.frame.size.width, 50)];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"点击定位当前地址" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(backVCAndPosition:) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:btn];
}

- (void)backVCAndPosition:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
    //定位
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
