//
//  wp.m
//  lianxi
//
//  Created by wqeqweweq on 15/11/11
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "WPShopVIewController.h"
#import "CELL.h"
#import "CELL2.h"
@interface  WPShopVIewController()<UITableViewDataSource, UITableViewDelegate>
{
    UILabel*lab;
    NSArray*array;
    UIView*butt;
    NSMutableArray*arr;
    NSMutableArray*arr1;
UIView*vl2;
    UILabel*buynumber;
    UIButton*leavenumber;
    UILabel*sign;
    UIView*vl;
    NSMutableArray*aar;
}
@property (nonatomic,assign)NSInteger *selectedTag;


@end
@implementation WPShopVIewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    aar=[[NSMutableArray alloc]init];

    array=[[NSMutableArray alloc]initWithCapacity:3];
    arr=[[NSMutableArray alloc]initWithCapacity:3];
    arr1=[[NSMutableArray alloc]initWithCapacity:3];
    //_selectedTag = 100;
    array=@[@"销量排行榜",@"缤纷水果系列",@"经典水果系列",@"鲜果单品",@"今日特价",@""];
    NSLog(@"%lu",(unsigned long)array.count);
     [self setUpView];
    array=[[NSMutableArray alloc]initWithCapacity:0];
    
}
-(void)setUpView{
              UIImageView*image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"0b55b319ebc4b745f5d8c385c9fc1e178b8215d0.jpg"]];
    image.frame=CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height/5);

    [self.view addSubview:image];
    
    UIButton*butten=[[UIButton alloc]initWithFrame:CGRectMake(0, image.frame.size.height, self.view.frame.size.width/3, 30)];
    [butten setUserInteractionEnabled:YES];
    [butten setTitle:@"商品" forState:UIControlStateNormal];
    [butten setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    butten.backgroundColor=[UIColor whiteColor];
    [butten addTarget:self action:@selector(shangjia:) forControlEvents:UIControlEventTouchUpInside];
    butten.tag=101;
    
    leavenumber=[[UIButton alloc]initWithFrame:CGRectMake(250, 10, 100, 30)];
    leavenumber.backgroundColor=[UIColor grayColor];
    [leavenumber setTitle:@"还差20元" forState:UIControlStateNormal];
        [leavenumber.layer setCornerRadius:4];
    
    
    
    
    
    UIButton*butten2=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, image.frame.size.height, self.view.frame.size.width/3, 30)];
    [butten2 setUserInteractionEnabled:YES];

      [butten2 setTitle:@"评价" forState:UIControlStateNormal];
    [butten2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    butten2.backgroundColor=[UIColor whiteColor];
     butten2.tag=102;
    [butten2 addTarget:self action:@selector(shangjia:) forControlEvents:UIControlEventTouchUpInside];
   
      UIButton*butten3=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3*2, image.frame.size.height, self.view.frame.size.width/3, 30)];
    [butten3 setUserInteractionEnabled:YES];

        [butten3 setTitle:@"商家详情" forState:UIControlStateNormal];
    [butten3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    butten3.backgroundColor=[UIColor whiteColor];
     butten3.tag=103;
    
    
    [butten3 addTarget:self action:@selector(shangjia:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:butten];
    [self.view addSubview:butten2];
    [self.view addSubview:butten3];
    [aar addObject:butten];
    [aar addObject:butten2];
    [aar addObject:butten3];

    [self.view addSubview:vl2];
    lab=[[UILabel alloc]initWithFrame:CGRectMake(0, butten.frame.origin.y+butten.frame.size.height-1, self.view.frame.size.width/3, 2)];
    lab.backgroundColor=[UIColor redColor];
    [self.view addSubview:lab];
   
        butt=[[UIView alloc]initWithFrame:CGRectMake(0,lab.frame.origin.y+lab.frame.size.height, self.view.frame.size.width/3-5,(self.view.frame.size.height-lab.frame.size.height-lab.frame.origin.y-44))];
    butt.backgroundColor=[UIColor whiteColor];
    NSLog(@"%f",butt.frame.size.width);
                [self.view addSubview:butt];
    
    
    UIButton*butten4=[[UIButton alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height-90, 80, 80)];
    butten4.backgroundColor=[UIColor grayColor];
    [butten4.layer setCornerRadius:40];
    
    
    
    UIView*myview=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-64, self.view.frame.size.width, 64)];
    myview.backgroundColor=[UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:butt.bounds style:UITableViewStylePlain];
    //去掉分割线
    //[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.bounces=NO;
    tableView.tag=101;
    [butt addSubview:tableView];
    [self.view addSubview:butt];
    buynumber=[[UILabel alloc]initWithFrame:CGRectMake(105, 20, 140, 14)];
    buynumber.text=@"购物车空空如也~";
    buynumber.textColor=[UIColor blackColor];
    [myview addSubview:leavenumber];
    [myview addSubview:buynumber];
    [self.view addSubview:myview];
    [self.view addSubview:butten4];
    sign=[[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3-5, lab.frame.size.height+lab.frame.origin.y, self.view.frame.size.width/3*2+5,30 )];
    sign.backgroundColor=[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    sign.textColor=[UIColor grayColor];
    sign.text=@"  销量排行榜";
    [self.view addSubview:sign];
    vl=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3-5, sign.frame.origin.y+sign.frame.size.height, self.view.frame.size.width-self.view.frame.size.width/3+5, self.view.frame.size.height-( sign.frame.origin.y+sign.frame.size.height+64))];
    vl.backgroundColor=[UIColor greenColor];
    [self.view addSubview:vl];
    UITableView *tableView2 = [[UITableView alloc] initWithFrame:vl.bounds style:UITableViewStylePlain];
    //去掉分割线
    //[tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView2.dataSource = self;
    tableView2.delegate = self;
    tableView2.tag=102;
    [vl addSubview:tableView2];
    [self.view addSubview:vl];
    UIButton*lb1=[[UIButton alloc]initWithFrame:CGRectMake(20, 64, 60, 60)];
    lb1.backgroundColor=[UIColor blackColor];
    [lb1.layer setCornerRadius:30];
    [self.view addSubview:lb1];
    UIButton*lb12=[[UIButton alloc]initWithFrame:CGRectMake(20, 20, 30, 30)];
    lb12.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:lb12];
    UIButton*lb123=[[UIButton alloc]initWithFrame:CGRectMake(100, 64, self.view.frame.size.width-120, 60)];
    lb123.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:lb123];
    UIButton*lb1234=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-20-30, 20,30, 30)];
    lb1234.backgroundColor=[UIColor blackColor];
    
    [self.view addSubview:lb1234];


   }

-(void)shangjia:(UIButton*)butten{
 
    for(UIButton * btn in aar){
        if (butten.tag==btn.tag) {
            NSLog(@"%ld",(long)butten.tag);
            [butten setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

            [UIView animateWithDuration:0.1 animations:^{
                //设置动画
                [lab setFrame:CGRectMake(btn.frame.origin.x,btn.frame.origin.y+btn.frame.size.height-1, self.view.frame.size.width/3, 2) ];

                           }];
        }
        else{
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    }
            }
   
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==101) {
        return 6;
    }
    else
    {
        return 3;
    }
    //arrry.count
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==101) {
        static NSString *chatCellIdentifer = @"chatCellIdentifer";
        CELL *cell = [tableView dequeueReusableCellWithIdentifier:chatCellIdentifer];
        
        
        if (!cell) {
            cell = [[CELL alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chatCellIdentifer];
            
             [arr addObject:cell];
            
            
            if (indexPath.row==5) {
                cell.backgroundColor=[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
               
                
            }
            else
            {
                cell.backgroundColor=[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
            }
            
            
            
        }
        [cell setDataWithModel:cell nstring:butt index:indexPath];
              
        return cell;
 
    }
    else{
        static NSString *chatCellIdentifer = @"chatCellIdentifer";
        CELL2 *cell = [tableView dequeueReusableCellWithIdentifier:chatCellIdentifer];
        
        
        if (!cell) {
            cell = [[CELL2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:chatCellIdentifer];
            
            // [arr addObject:cell];
             [arr1 addObject:cell];
            
            [cell setDataWithModel1:cell  nstring:vl ];
        }
        //[cell setDataWithModel:cell nstring:butt index:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;

        return cell;

    }
    
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==101) {
         return (self.view.frame.size.height-lab.frame.size.height-lab.frame.origin.y-44)/6 ;
    }
    else{
        return  (self.view.frame.size.height-(sign.frame.origin.y+sign.frame.size.height+64))/3;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (tableView.tag==101) {
        UITableViewCell*cell=arr[indexPath.row];
        cell.contentView.backgroundColor=[UIColor whiteColor];
          }
    else
        if (tableView.tag==102) {
            
        
    {
        UITableViewCell*cell=arr1[indexPath.row];
        cell.contentView.backgroundColor=[UIColor redColor];
        
    }}
       }
   @end
