//
//  HSCShopModel.m
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/10.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import "HSCShopModel.h"

@implementation HSCShopModel
+ (HSCShopModel *)creatModelWithArray:(NSArray *)arr{
    HSCShopModel *model = [[HSCShopModel alloc] init];
    if (arr) {
        model.shopName = arr[0];
        model.orderState = arr[1];
        model.price = arr[2];
        model.date = arr[3];
        model.information = arr[4];
    }
    
    
    return model;

}
- (void)setfoodImage:(HSCShopModel *)model and:(UIImage *)food{
    model.foodImage = food;
}
@end
