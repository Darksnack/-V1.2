//
//  CELL.h
//  lianxi
//
//  Created by wqeqweweq on 15/11/13.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CELL : UITableViewCell
@property(nonatomic,strong)NSMutableArray*array;
-(void)setDataWithModel:(CELL *)cell nstring:(UIView*)butt index:(NSIndexPath*)indexPath;

-(void)setDataWithModel1:(CELL *)cell  nstring:(UIView*)butt ;
@end
