//
//  HSCOrderDetailsView.m
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/13.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCOrderDetailsView.h"
@interface HSCOrderDetailsView()<UITableViewDataSource, UITableViewDelegate>
@end
@implementation HSCOrderDetailsView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self setUpView];
    }
    return  self;
}
#pragma mark -- 设置视图
- (void)setUpView{
    UITableView *DetailsTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-40) style:UITableViewStyleGrouped];
    DetailsTabelView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    DetailsTabelView.tableHeaderView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, 0.01)];
    DetailsTabelView.delegate = self;
    DetailsTabelView.dataSource = self;
    [self addSubview:DetailsTabelView];
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, DetailsTabelView.frame.size.height, self.frame.size.width, 40)];
    downView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    [self addSubview:downView];
    UIButton *buyAgain = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, downView.frame.size.width-10, downView.frame.size.height-10)];
    buyAgain.backgroundColor = [UIColor redColor];
    [buyAgain setTitle:@"再来一单" forState:UIControlStateNormal];
    [buyAgain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [downView addSubview:buyAgain];

}
#pragma mark -- UITableViewDataSource,
#pragma mark -- 设置Section中row的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
#pragma mark -- 设置TableView中Section的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  2;
}
#pragma mark -- 设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    return cell;
}
#pragma mark -- UITableViewDelegate
@end
