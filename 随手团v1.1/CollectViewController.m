//
//  CollectViewController.m
//  美团
//
//  Created by Angus on 15/11/12.
//  Copyright © 2015年 Angus. All rights reserved.
//

#import "CollectViewController.h"

@interface CollectViewController ()

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0  blue:244/255.0  alpha:1];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.pic.jpg"]];
    [imageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:imageView];
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

@end
