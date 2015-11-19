//
//  RootViewController.m
//  随手团
//
//  Created by wqeqweweq on 15/11/11.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "RootViewController.h"
#import "HSCOrderTableViewController.h"

#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "NetWork.h"
#import "FYRootViewController.h"
#import "MineViewController.h"
@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];

    // Do any additional setup after loading the view.
    FYRootViewController *firstIndex = [[FYRootViewController alloc] init];
    
    UINavigationController *mapsNav = [[UINavigationController alloc] initWithRootViewController:firstIndex];
    [mapsNav.tabBarItem setTitle:@"首页"];
    [mapsNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:126/255.0 green:172/255.0 blue:16/255.0 alpha:1], NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    [mapsNav.tabBarItem setImage:[UIImage imageNamed:@"star_L.png"]];
    [mapsNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"star_F.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewControllers addObject:mapsNav];
    
   HSCOrderTableViewController *homeVC = [[HSCOrderTableViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    //[self.tabBar setTintColor:[UIColor blueColor]];
    [homeNav.tabBarItem setTitle:@"订单"];
    //改变tabBarItem选中状态下的title字体颜色
    [homeNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:126/255.0 green:172/255.0 blue:16/255.0 alpha:1], NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    [homeNav.tabBarItem setImage:[UIImage imageNamed:@"copy_file_L.png"]];
    //设置选中状态图片，让图片一直在选中时展示
    [homeNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"copy_file_F.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewControllers addObject:homeNav];
    
    MineViewController *settingVC = [[MineViewController alloc] init];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:settingVC];
    [settingNav.tabBarItem setTitle:@"我的"];
    [settingNav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:126/255.0 green:172/255.0 blue:16/255.0 alpha:1], NSForegroundColorAttributeName, nil] forState:UIControlStateHighlighted];
    
    [settingNav.tabBarItem setImage:[UIImage imageNamed:@"user_L.png"]];
    [settingNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"user_F.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [viewControllers addObject:settingNav];


    
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    self.viewControllers = viewControllers;
    
   }








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end