//
//  HSCTableViewCell.h
//  随手团
//
//  Created by 贺世昌 on 15/11/10.
//  Copyright © 2015年 贺世昌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSCShopModel.h"
@protocol HSCTableViewCellDelegate<NSObject>
- (void)clickDownViewInCell:(NSString *)str;
- (void)clickUpViewInCell;
@end
@interface HSCTableViewCell : UITableViewCell
@property(nonatomic, weak) id<HSCTableViewCellDelegate> delegate;
@property(nonatomic,strong)UILabel *tmpLabel;

- (void)tabelViewCellData:(HSCShopModel *)model;

@end
