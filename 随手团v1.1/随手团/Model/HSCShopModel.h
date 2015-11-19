//
//  HSCShopModel.h
//  随手团的订单
//
//  Created by 贺世昌 on 15/11/10.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HSCShopModel : NSObject
@property(nonatomic, copy) NSString * shopName;
@property(nonatomic, strong) UIImage *arrowImage;
@property(nonatomic, copy) NSString *orderState;
@property(nonatomic, strong) UIImage *foodImage;
@property(nonatomic, copy) NSString * price;
@property(nonatomic, copy) NSString * date;
@property(nonatomic, copy) NSString *information;
+ (HSCShopModel *)creatModelWithArray:(NSArray *)arr;
- (void)setfoodImage:(HSCShopModel *)model and:(UIImage *)food;
@end
