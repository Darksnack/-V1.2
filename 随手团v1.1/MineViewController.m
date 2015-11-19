//
//  ViewController.m
//  美团
//
//  Created by Angus on 15/11/10.
//  Copyright © 2015年 Angus. All rights reserved.
//

#import "MineViewController.h"
#import "AddressViewController.h"
#import "sqlite3.h"
#import "CollectViewController.h"
#import "SettingVC.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"1.png"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    //定义NavigationBar的颜色为透明
    // Do any additional setup after loading the view, typically from a nib.
    [self setUpView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setUpView{
    NSString *path = @"http://101.200.160.247:8080/web/yaoyao.txt";
    NSURL *url = [NSURL URLWithString:path];
    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
   NSString *imagepath = @"http://101.200.160.247:8080/web/Head.jpg";
     NSURL *imageurl = [NSURL URLWithString:imagepath];
    NSData *imageData = [NSData dataWithContentsOfURL:imageurl];
    UIImage *image1 = [UIImage imageWithData:imageData];
    //从网络上获取用户头像与昵称
    
    
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -100, self.view.frame.size.width, self.view.frame.size.height+100) style:UITableViewStyleGrouped];

    tableView.scrollEnabled = NO;
    [tableView setBackgroundColor:[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1]];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView setContentSize:CGSizeMake(0, 0)];

    [self.view addSubview:tableView];
    //定义tableview
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height/20, 60, 60)];
    image.backgroundColor = [UIColor lightGrayColor];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = 30;
    image.layer.borderColor = ([UIColor whiteColor].CGColor);
    image.layer.borderWidth = 2.0;
    image.image = image1;
    [self.view addSubview:image];
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-75, self.view.frame.size.height/20+70, 150, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.text = str;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:label];
    
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/3-self.view.frame.size.height/10-1, self.view.frame.size.width, self.view.frame.size.height/10)];
    buttonView.backgroundColor = [UIColor grayColor];
    buttonView.alpha = 0.3;
    [self.view addSubview:buttonView];
    
    UIButton *moneyButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/3, self.view.frame.size.height/10)];
    moneyButton.layer.masksToBounds = YES;
    moneyButton.layer.borderWidth = 0.5;
    moneyButton.layer.borderColor = ([UIColor blackColor].CGColor);
    moneyButton.backgroundColor = [UIColor clearColor];
    [moneyButton setTitle:@"0元\n美团券" forState:UIControlStateNormal];
    moneyButton.titleLabel.numberOfLines = 2;
    moneyButton.titleLabel.textColor = [UIColor blackColor];
    [moneyButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    moneyButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [moneyButton.titleLabel setTextColor:[UIColor blackColor]];
    [buttonView bringSubviewToFront:moneyButton];
    [buttonView addSubview:moneyButton];
    
    UIButton *secondButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, 0, self.view.frame.size.width/3, self.view.frame.size.height/10)];
    secondButton.backgroundColor = [UIColor clearColor];
    secondButton.layer.masksToBounds = YES;
    secondButton.layer.borderWidth = 0.5;
    secondButton.layer.borderColor = ([UIColor blackColor].CGColor);
    [secondButton setTitle:@"1元\n美团红包" forState:UIControlStateNormal];
    secondButton.titleLabel.numberOfLines = 2;
    secondButton.tintColor = [UIColor blackColor];
    [secondButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    secondButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [buttonView addSubview:secondButton];
    
    UIButton *thirdButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3*2, 0, self.view.frame.size.width/3, self.view.frame.size.height/10)];
    thirdButton.backgroundColor = [UIColor clearColor];
    thirdButton.layer.masksToBounds = YES;
    thirdButton.layer.borderWidth = 0.5;
    thirdButton.layer.borderColor = ([UIColor blackColor].CGColor);
    [thirdButton setTitle:@"0张\n商家代金券" forState:UIControlStateNormal];
    thirdButton.titleLabel.numberOfLines = 2;
    thirdButton.tintColor = [UIColor blackColor];
    [thirdButton.titleLabel setTextAlignment:NSTextAlignmentCenter];
    thirdButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    [buttonView addSubview:thirdButton];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1) {
        return 2;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section>0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    else{
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    
    if (indexPath.section==0) {

        cell.backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
        cell.backgroundView.backgroundColor = [UIColor redColor];
        
    }
    
    if (indexPath.section==1) {
        cell.textLabel.text = @"管理收货地址";
        NSString *imagepath = @"http://101.200.160.247:8080/items/pictures/232/grey_icons/pencil_L.png";
        NSURL *imageurl = [NSURL URLWithString:imagepath];
        NSData *imageData = [NSData dataWithContentsOfURL:imageurl];

        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
        
        
    }
    if (indexPath.section==1&&indexPath.row==1) {

        NSString *imagepath = @"http://101.200.160.247:8080/items/pictures/232/grey_icons/search_L.png";
        NSURL *imageurl = [NSURL URLWithString:imagepath];
        NSData *imageData = [NSData dataWithContentsOfURL:imageurl];

        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
        cell.textLabel.text = @"我的收藏";
    }
  
    
    if (indexPath.section==2) {
        cell.textLabel.text = @"管理收货地址";
        NSString *imagepath = @"http://101.200.160.247:8080/items/pictures/232/grey_icons/bookmark_L.png";
        NSURL *imageurl = [NSURL URLWithString:imagepath];
        NSData *imageData = [NSData dataWithContentsOfURL:imageurl];

        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
        cell.textLabel.text = @"帮助与反馈";
    }
    if (indexPath.section==3) {
        cell.textLabel.text = @"管理收货地址";
        NSString *imagepath = @"http://101.200.160.247:8080/items/pictures/232/grey_icons/drawer_L.png";
        NSURL *imageurl = [NSURL URLWithString:imagepath];
        NSData *imageData = [NSData dataWithContentsOfURL:imageurl];

        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;
        cell.textLabel.text = @"更多";
    }

    return cell;

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       
        return self.view.frame.size.height/3;
    }
    else{
        return  self.view.frame.size.height/20;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.view.frame.size.height/3/3/3-50;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1&&indexPath.row==0 ){

        AddressViewController *addVC = [[AddressViewController alloc]init];
        addVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController setNavigationBarHidden:NO];
        addVC.ctrl = self;
        [self.navigationController pushViewController:addVC animated:YES];
        
    }
    if (indexPath.section==1&&indexPath.row==1) {
        CollectViewController *collectVC = [[CollectViewController alloc]init];
        [self.navigationController pushViewController:collectVC animated:YES];
    }
    if (indexPath.section == 3) {
        SettingVC *settingVC = [[SettingVC alloc] init];
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    if (indexPath.section==2) {
        
    }
}


@end
