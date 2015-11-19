//
//  HSCOrderDetailsTableController.m
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/11.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCOrderDetailsViewController.h"
#import "HSCClickView.h"


#define BUTTONHEIGHT 44
@interface HSCOrderDetailsViewController ()


@property (nonatomic, strong) NSMutableArray *viewArray;
@end

@implementation HSCOrderDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpView];
    
}
#pragma mark -- 布置界面
- (void)setUpView{
    _viewArray = [NSMutableArray arrayWithCapacity:2];
    UIBarButtonItem *share = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_compose_highlighted.png"] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    [share setImage:[UIImage imageNamed:@"navigationbar_compose_highlighted.png"]];
    UIBarButtonItem *phone = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_compose_highlighted.png"]  style:UIBarButtonItemStylePlain target:self action:@selector(phone)];
    NSArray *navigationbarArray = [NSArray arrayWithObjects:phone, share, nil];
    self.navigationItem.rightBarButtonItems =  navigationbarArray;
    UIBarButtonItem *popBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_pop_highlighted.png"] style:UIBarButtonItemStylePlain target:self action:@selector(popUpController)];
    self.navigationItem.leftBarButtonItem = popBtnItem;
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    CGRect statusBarFrame=[[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarFrame=self.navigationController.navigationBar.frame;
    HSCClickView * view = [[HSCClickView alloc] initWithFrame:CGRectMake(0,statusBarFrame.size.height+navigationBarFrame.size.height,  [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-statusBarFrame.size.height-navigationBarFrame.size.height)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark -- 联系店家
- (void)phone{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"10086"];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    
}
#pragma mark -- 分享
- (void)share{
  //分享到第三方
}
#pragma mark -- 返回上个界面
- (void)popUpController{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
