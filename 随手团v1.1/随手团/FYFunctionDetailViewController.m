//
//  FYFunctionDetailViewController.m
//  外卖
//
//  Created by 艾尔 on 15/11/12.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYFunctionDetailViewController.h"

@interface FYFunctionDetailViewController ()

@property (nonatomic, strong) NSMutableArray *viewArray;

@property (nonatomic, strong) NSMutableArray *buttonArray;

@property (nonatomic, strong) UIView *menuView;

@property (nonatomic, strong) UIView *btnView;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation FYFunctionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = _functionName;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    [self.navigationController.navigationBar setTranslucent:YES];
    _viewArray = [[NSMutableArray alloc] initWithCapacity:0];
    _buttonArray = [[NSMutableArray alloc] initWithCapacity:0];
    _index = 0;
    [self setUpView];
}

- (void)setUpView{
    CGRect navigationBarFrame = self.navigationController.navigationBar.frame;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, navigationBarFrame.origin.y+navigationBarFrame.size.height, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    _btnView = view;
    [self.view addSubview:view];
    
    for (NSInteger index = 0; index<3; index++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5*(index+1)+((self.view.frame.size.width-20)/3)*index, 0, (self.view.frame.size.width-20)/3, view.frame.size.height)];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:@"" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = 1000+index;
        [btn addTarget:self action:@selector(openMenu:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonArray addObject:btn];
        [view addSubview:btn];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(btn.frame.size.width-30, (btn.frame.size.height-6)/2, 9, 6)];
        [imageView setImage:[UIImage imageNamed:@"icon_unfold.png"]];
        [btn addSubview:imageView];
        UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(btn.frame.size.width+btn.frame.origin.x, 0, 5, btn.frame.size.height)];
        if (index != 2) {
            view1.backgroundColor = [UIColor whiteColor];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2, view1.frame.size.height/3*2/2, 1, view1.frame.size.height/3)];
            [imageView setImage:[UIImage imageNamed:@"btn_grey.png"]];
            [view1 addSubview:imageView];
        }
        [_viewArray addObject:view1];
        [view addSubview:view1];
        
    }
    UIButton *btn = _buttonArray[0];
    UIButton *btn1 = _buttonArray[1];
    UIButton *btn2 = _buttonArray[2];
    if ([_functionName isEqualToString:@"美食"]) {
        [btn setTitle:_functionName forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"超市"]){
        [btn setTitle:@"生活超市" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"鲜果购"]){
        [btn setTitle:@"水果蔬菜" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"甜点饮品"]){
        [btn setTitle:@"甜点饮品" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"土豪馆"]){
        [btn setTitle:@"土豪馆" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"美团专送"]){
        [btn setTitle:@"商家分类" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"美团专送" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"鲜花蛋糕"]){
        [btn setTitle:@"鲜花蛋糕" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    else if ([_functionName isEqualToString:@"送药上门"]){
        [btn setTitle:@"药瓶" forState:UIControlStateNormal];
        [btn1 setTitle:@"综合排序" forState:UIControlStateNormal];
        [btn2 setTitle:@"优惠活动" forState:UIControlStateNormal];
    }
    _menuView = [[UIView alloc] init];
    [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, 0)];
    _menuView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_menuView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _menuView.frame.size.height-20, _menuView.frame.size.width, 0)];
    [_imageView setImage:[UIImage imageNamed:@"bg_login_animation.png"]];
    [_menuView addSubview:_imageView];
    
}

- (void)openMenu:(UIButton *)btn{
    if (_index == 0) {
        _index = btn.tag;
        [UIView animateWithDuration:0.1 animations:^{
            if (_menuView.frame.size.height != 0) {
                [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, 0)];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            else{
                [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height/3*2)];
                [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                
            }
        }];
        
    }
    else if (_index != btn.tag) {
        
        _index = btn.tag;
        [UIView animateWithDuration:0.1 animations:^{
            [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, 0)];
        } completion:^(BOOL finished) {
            [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height/3*2)];
            [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        }];
    }
    else if (_index == btn.tag){
        _index = btn.tag;
        [UIView animateWithDuration:0.1 animations:^{
            if (_menuView.frame.size.height != 0) {
                [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, 0)];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            else{
                [_menuView setFrame:CGRectMake(0, _btnView.frame.size.height+_btnView.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height/3*2)];
                [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            }
        }];
    }
    
}

- (void)backVC{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
