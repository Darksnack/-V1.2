//
//  HSCTableViewCell.m
//  随手团
//
//  Created by 贺世昌 on 15/11/10.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCTableViewCell.h"

@interface HSCTableViewCell()
@property(nonatomic, strong) UILabel *shopName;
@property(nonatomic, strong) UIImageView *arrowImage;
@property(nonatomic, strong) UILabel *orderState;
@property(nonatomic, strong) UIImageView *foodImage;
@property(nonatomic, strong) UILabel *price;
@property(nonatomic, strong) UILabel *date;
@property(nonatomic, strong) UILabel *information;
@end
@implementation HSCTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
       [self setUpView];
    }
    return self;

}
#pragma mark -- 设置界面
- (void)setUpView{
    UIView *UpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35)];
    UpView.backgroundColor = [UIColor whiteColor];
   [self.contentView addSubview:UpView];
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickedUpView)];
    [UpView addGestureRecognizer:tap];
    
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, UpView.frame.size.height+1, UpView.frame.size.width, 110-35-1)];
    downView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:downView];
    UITapGestureRecognizer *tapDown = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClickedDownView)];
    [downView addGestureRecognizer:tapDown];
    
    _shopName = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 2*UpView.frame.size.width/3, UpView.frame.size.height-4)];
    _shopName.backgroundColor = [UIColor whiteColor];
    [UpView addSubview:_shopName];
    _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(_shopName.frame.origin.x+_shopName.frame.size.width, (UpView.frame.size.height-10)/2, 10, 10)];
    _arrowImage.backgroundColor = [UIColor whiteColor];
    
    [UpView addSubview:_arrowImage];
    _orderState = [[UILabel alloc] initWithFrame:CGRectMake(UpView.frame.size.width-70, 2, 60, _shopName.frame.size.height)];
    _orderState.backgroundColor = [UIColor whiteColor];
    _tmpLabel = _orderState;
    [UpView addSubview:_orderState];
    _foodImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, downView.frame.size.width/3, downView.frame.size.height-20)];
    _foodImage.backgroundColor = [UIColor whiteColor];
    [downView addSubview:_foodImage];
    _price = [[UILabel alloc] initWithFrame:CGRectMake(_foodImage.frame.size.width+_foodImage.frame.origin.x+10, 10, 50, _foodImage.frame.size.height/3)];
    _price.backgroundColor = [UIColor whiteColor];
    [downView addSubview:_price];
    _date = [[UILabel alloc] initWithFrame:CGRectMake(_price.frame.origin.x, _price.frame.origin.y+_price.frame.size.height, 150, _price.frame.size.height)];
    _date.backgroundColor = [UIColor whiteColor];
    
    [downView addSubview:_date];
    _information = [[UILabel alloc] initWithFrame:CGRectMake(_date.frame.origin.x, _date.frame.origin.y+_date.frame.size.height, downView.frame.size.width-_date.frame.origin.x-10, _date.frame.size.height)];
    _information.backgroundColor = [UIColor whiteColor];
    [downView addSubview:_information];

}
#pragma mark -- 点击UpView的手势响应事件
- (void)tapClickedUpView{
    //跳转到店铺订餐页面
    if ([self.delegate respondsToSelector:@selector(clickUpViewInCell)]) {
        [self.delegate clickUpViewInCell];
    }
}

#pragma mark -- 点击downView的手势响应事件
- (void)tapClickedDownView{
    if ([self.delegate respondsToSelector:@selector(clickDownViewInCell:)]) {
       
        [self.delegate clickDownViewInCell:_orderState.text];
    }
}
#pragma mark -- 配置数据
- (void)tabelViewCellData:(HSCShopModel *)model{
    _shopName.text = model.shopName;
    _arrowImage.image = [UIImage imageNamed:@"common_icon_small_arrow.png"];
    _orderState.text = model.orderState;
    _foodImage.image = model.foodImage;
    _price.text = [NSString stringWithFormat:@"￥%@",model.price];
    _date.text = model.date;
    _information.text = model.information;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
