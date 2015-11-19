//
//  SettingVC.m
//  设置
//
//  Created by darksnake on 15/11/12.
//  Copyright © 2015年 darksnake. All rights reserved.
//

#import "SettingVC.h"
#import "SettingCell.h"
@interface SettingVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tabelView;

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem.title = @"编辑";
    [self setUpView];
}
#pragma mark -- 配置视图
- (void)setUpView{
    _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+4, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    [self.view addSubview:_tabelView];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellidentifier = @"cell";
    SettingCell *cell = [_tabelView dequeueReusableCellWithIdentifier:cellidentifier] ;
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 350;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Contacts.png"]];
    
    return imageView;
}
#pragma mark -- cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (indexPath == 0) {
        
    }
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
