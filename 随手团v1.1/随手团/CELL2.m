//
//  CELL2.m
//  lianxi
//
//  Created by wqeqweweq on 15/11/14.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "CELL2.h"

@implementation CELL2
-(void)setDataWithModel1:(CELL2 *)cell  nstring:(UIView*)butt {
    
    
   
    
    
    UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(10,10,80,80)];
    button.backgroundColor=[UIColor blackColor];
    
    [self.contentView addSubview:button];
    
    UILabel*button1=[[UILabel alloc]initWithFrame:CGRectMake(100,10,100,25)];
    button1.backgroundColor=[UIColor blackColor];
    
    [cell.contentView addSubview:button1];
    
    UILabel*button12=[[UILabel alloc]initWithFrame:CGRectMake(100,40,100,20)];
    button12.backgroundColor=[UIColor blackColor];
    
    [cell.contentView addSubview:button12];
    UILabel*button123=[[UILabel alloc]initWithFrame:CGRectMake(100,65,100,25)];
    button123.backgroundColor=[UIColor blackColor];
    
    [cell.contentView addSubview:button123];
    UILabel*lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, cell.frame.size.width-10, 1)];
    lable.backgroundColor=[UIColor blackColor];
    [cell.contentView addSubview:lable];
    UILabel*lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 105,  cell.frame.size.width-10, 25)];
    [cell.contentView addSubview:lable1];
    
    
}

@end
