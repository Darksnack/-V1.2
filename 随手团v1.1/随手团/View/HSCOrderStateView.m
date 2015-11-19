//
//  HSCOrderStateView.m
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/13.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCOrderStateView.h"

@implementation HSCOrderStateView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        [self setUpView];
    }
    return self;

}
#pragma mark -- 设置视图
- (void)setUpView{
    UIView *upView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-40)];
    upView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    [self addSubview:upView];
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, upView.frame.size.height, self.frame.size.width, 40)];
    downView.backgroundColor = [UIColor whiteColor];
    [self addSubview:downView];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, downView.frame.size.height-10, downView.frame.size.height-10)];
    imageView.backgroundColor = [UIColor redColor];
    [downView addSubview:imageView];
    UIButton *orderComplain = [[UIButton alloc] initWithFrame:CGRectMake(imageView.frame.size.width+imageView.frame.origin.x+5, 5, downView.frame.size.width-imageView.frame.size.width-20, downView.frame.size.height-10)];
    [orderComplain setTitle:@"订单投诉" forState:UIControlStateNormal];
    [orderComplain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    orderComplain.layer.borderWidth = 1;
    [orderComplain addTarget:self action:@selector(complain) forControlEvents:UIControlEventTouchUpInside];
    [downView addSubview:orderComplain];
}
#pragma mark -- 投诉按钮的点击事件
- (void)complain{
    NSLog(@"欢迎投诉");
}
@end
