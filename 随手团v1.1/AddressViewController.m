
//
//  AddressViewController.m
//  美团
//
//  Created by Angus on 15/11/10.
//  Copyright © 2015年 Angus. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"我的收货地址";
    
    [self setUpView];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setUpView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+100) style:UITableViewStylePlain];
    tableView.scrollEnabled = YES;
    [tableView setBackgroundColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1]];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setContentSize:CGSizeMake(0, 0)];
    [self.view addSubview:tableView];
   
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(panClicked:)];
    [pan setDirection:UISwipeGestureRecognizerDirectionRight];
    [tableView addGestureRecognizer:pan];
    
    
    
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return 1;
}

- (void)panClicked:(UISwipeGestureRecognizer *)pan{
 
    if (pan.direction==UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
 
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    if (indexPath.section==0) {
        
        cell.textLabel.text = @"药戚琨 女士 13466278904 德惠智商贸有限公司 物产大厦二号楼，2楼尚观科技";
        cell.textLabel.lineBreakMode = NSLineBreakByTruncatingTail;

        
    }
    
    if (indexPath.section==1) {
        cell.textLabel.text = @"吴国宇 男士 18640288652 凌博科技有限公司 三好街，2楼尚观科技";
        
        
        
    }
    if (indexPath.section==1&&indexPath.row==1) {
        
       
        
    }
    
    
    if (indexPath.section==2) {
     
        cell.textLabel.text = @"匿名 女士 13040128977 锦州市太和区 物产大厦二号楼，2楼尚观科技";
    }
    if (indexPath.section==3) {
        
        
        cell.textLabel.text = @"更多";
    }

    return cell;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  self.view.frame.size.height/12;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}


@end
