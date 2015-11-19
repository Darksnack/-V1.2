//
//  CELL.m
//  lianxi
//
//  Created by wqeqweweq on 15/11/13.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "CELL.h"

@implementation CELL
-(void)setDataWithModel:(CELL *)cell nstring:(UIView*)butt index:(NSIndexPath*)indexPath
{
    if (indexPath.row==0) {
        UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(0,0
                                                                ,butt.frame.size.width,butt.frame.size.height/5)];
        [button setText:@"销量排行榜" ];
        button.backgroundColor=[UIColor clearColor];
        button.textColor=[UIColor redColor];
        button.textAlignment=UITextAlignmentCenter;
        [cell.contentView addSubview:button];
        button.tag=110;
        
    }
    if (indexPath.row==1) {
        UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(0,0
                                                                ,butt.frame.size.width,butt.frame.size.height/5)];
        [button setText:@"缤纷水果系列" ];
        button.backgroundColor=[UIColor clearColor];
        button.textColor=[UIColor blackColor];
        button.textAlignment=UITextAlignmentCenter;
        [cell.contentView addSubview:button];
        button.tag=111;

        
    }
    if (indexPath.row==2) {
        UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(0,0
                                                                ,butt.frame.size.width,butt.frame.size.height/5)];
        [button setText:@"鲜果单品" ];
        button.backgroundColor=[UIColor clearColor];
        button.textColor=[UIColor blackColor];
        button.textAlignment=UITextAlignmentCenter;

        [cell.contentView addSubview:button];
        button.tag=112;

        
    }
    if (indexPath.row==3) {
        UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(0,0                                                                ,butt.frame.size.width,butt.frame.size.height/5)];
        [button setText:@"今日特价" ];
        button.backgroundColor=[UIColor clearColor];
        button.textColor=[UIColor blackColor];
        button.textAlignment=UITextAlignmentCenter;

        [cell.contentView addSubview:button];
        button.tag=113;

        
    }
    if (indexPath.row==4) {
        UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(0,0
                                                                ,butt.frame.size.width,butt.frame.size.height/5)];
        [button setText:@"销量排行榜" ];
        button.backgroundColor=[UIColor clearColor];
        button.textColor=[UIColor blackColor];
        button.textAlignment=UITextAlignmentCenter;

        [cell.contentView addSubview:button];
        button.tag=114;

        
    }


}
//-(void)setDataWithModel1:(CELL *)cell  nstring:(UIView*)butt {
//    
//        
//    self.contentView.backgroundColor=[UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1];
//
//    
//    UILabel*button=[[UILabel alloc]initWithFrame:CGRectMake(10,10,80,80)];
//    button.backgroundColor=[UIColor blackColor];
//    
//    [cell.contentView addSubview:button];
//    
//    UILabel*button1=[[UILabel alloc]initWithFrame:CGRectMake(100,10,100,25)];
//    button1.backgroundColor=[UIColor blackColor];
//   
//    [cell.contentView addSubview:button1];
//    
//    UILabel*button12=[[UILabel alloc]initWithFrame:CGRectMake(100,40,100,20)];
//    button12.backgroundColor=[UIColor blackColor];
//    
//    [cell.contentView addSubview:button12];
//    UILabel*button123=[[UILabel alloc]initWithFrame:CGRectMake(100,65,100,25)];
//    button123.backgroundColor=[UIColor blackColor];
//  
//    [cell.contentView addSubview:button123];
//    UILabel*lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, cell.frame.size.width-10, 1)];
//    lable.backgroundColor=[UIColor blackColor];
//    [cell.contentView addSubview:lable];
//    UILabel*lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 105,  cell.frame.size.width-10, 25)];
//    [cell.contentView addSubview:lable1];
//   
//    
//}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    if (selected) {
//        self.contentView.backgroundColor = [UIColor redColor];
//        [self.contentView setAlpha:0.2];
//    }
//    else {
//        self.contentView.alpha = 1;
//    }
//}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
//    [super setHighlighted:highlighted animated:animated];
//    self.contentView.backgroundColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:0.2];
//}
@end
