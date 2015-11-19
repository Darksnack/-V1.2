//
//  HSCClickView.m
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/12.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCClickView.h"
#import "HSCOrderStateView.h"
#import "HSCOrderDetailsView.h"
@interface HSCClickView()<UIScrollViewDelegate>
{
    UIButton *selectBtn;
    UIView *lineView;
    
}
@property (nonatomic, strong) UIScrollView *scrolView;
@property (nonatomic, strong) NSMutableArray *btnArray;
@end
@implementation HSCClickView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _btnArray = [NSMutableArray arrayWithCapacity:1];
        [self setUpView];
        
    }
    return self;

}
#pragma mark -- 设置视图
- (void)setUpView{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0,0,  [UIScreen mainScreen].bounds.size.width, 44)];
    [self addSubview:view];
    UIButton *stateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [stateBtn setTitle:@"订单状态" forState:UIControlStateNormal];
    [stateBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [stateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    stateBtn.frame = CGRectMake(0, 0, view.frame.size.width/2, view.frame.size.height);
    stateBtn.tag = 1;
    [self clickStateBtn:stateBtn];
    [stateBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:stateBtn];
    [_btnArray addObject:stateBtn];
    
    
    lineView = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-2, self.frame.size.width/2, 2)];
    lineView.backgroundColor = [UIColor redColor];
    [view addSubview:lineView];
    
    UIButton *detailsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [detailsBtn setTitle:@"订单详情" forState:UIControlStateNormal];
    [detailsBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [detailsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    detailsBtn.frame = CGRectMake(view.frame.size.width/2, 0, view.frame.size.width/2, view.frame.size.height);
    detailsBtn.tag = 2;
    [detailsBtn addTarget:self action:@selector(clickStateBtn:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:detailsBtn];
    [_btnArray addObject:detailsBtn];
    
    UIScrollView *scrolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, view.frame.origin.y+view.frame.size.height, view.frame.size.width, self.frame.size.height-view.frame.size.height-view.frame.origin.y)];
    scrolView.contentSize = CGSizeMake(view.frame.size.width*2, 0);
    scrolView.backgroundColor = [UIColor cyanColor];
    scrolView.pagingEnabled = YES;
    scrolView.bounces = NO;
    scrolView.showsHorizontalScrollIndicator = NO;
    scrolView.delegate = self;
    [self addSubview:scrolView];
    _scrolView = scrolView;
    
    
    
    HSCOrderStateView *stateView = [[HSCOrderStateView alloc] initWithFrame:_scrolView.bounds];
    [scrolView addSubview:stateView];
    
    HSCOrderDetailsView *detailsView = [[HSCOrderDetailsView alloc] initWithFrame:CGRectMake(view.frame.size.width, 0, view.frame.size.width, scrolView.frame.size.height)];
    
    [scrolView addSubview:detailsView];
}
#pragma mark -- StateBtn点击事件
- (void)clickStateBtn:(UIButton *)sender{
    
    _scrolView.contentOffset = CGPointMake(self.frame.size.width*(sender.tag-1), 0);
    selectBtn.selected = NO;
    lineView.frame = CGRectMake(sender.frame.origin.x, sender.frame.size.height-2, sender.frame.size.width, 2);
    sender.selected = YES;
    
    selectBtn = sender;
}
#pragma mark --UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    //通过偏移量获取当前所在的页数为第几页
    NSInteger page = x/scrollView.frame.size.width;
    [self clickStateBtn:_btnArray[page]];
}

@end
