//
//  KefuViewController.m
//  客服
//
//  Created by darksnake on 15/11/13.
//  Copyright © 2015年 darksnake. All rights reserved.
//

#import "KefuViewController.h"



@interface KefuViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong)UIAlertController *alertContoller;
@property (nonatomic, copy)NSMutableArray *dictArray;

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation KefuViewController
- (void)viewWillAppear:(BOOL)animated{
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"警告" message:@"无法连接服务器" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertC addAction:cancelAction];
    [self presentViewController:alertC animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"suishoutuankefu",@"name", @"尊敬的用户你好，欢迎您使用随手团外卖在线客服", @"content" ,nil];
    _dictArray = [[NSMutableArray alloc] initWithCapacity:0];
    [_dictArray addObject:dict1];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dictArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellideentifier = @"cellideentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellideentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellideentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else{
        for (UIView *cellView in cell.subviews) {
            [cellView removeFromSuperview];
        }
    }
    NSDictionary *dict = [_dictArray objectAtIndex:indexPath.row];
    
    //头像
    
    if ([[dict objectForKey:@"name"] isEqualToString:@"suishoutuankefu"]) {
        UIImageView *photo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 50, 50)];
        [cell addSubview:photo];
        photo.image = [UIImage imageNamed:@"photo.png"];
        
    }
    if ([dict objectForKey:@"content"]) {
        [cell addSubview:[self bubbleView:[dict objectForKey:@"content"] from:YES withPosition:105]];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = [_dictArray objectAtIndex:indexPath.row];
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14.0]};
    CGSize size = [[dict objectForKey:@"content"] boundingRectWithSize:CGSizeMake(100.0f, 20000.0f) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return size.height+44;
}
#pragma mark -- 泡泡文本
- (UIView *)bubbleView:(NSString *)text from:(BOOL )fromSelf withPosition:(NSInteger)position{
    // 设置泡泡图片
    UIFont *font = [UIFont systemFontOfSize:14];
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize size = [text boundingRectWithSize:CGSizeMake(100.0f, 20000.0f) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    UIView *returnView = [[UIView alloc] initWithFrame:CGRectZero];
    returnView.backgroundColor = [UIColor clearColor];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:fromSelf?@"ReceiverTextNodeBkg":@"SenderAppNodeBkg_HL" ofType:@"png"];
    UIImage *bubble = [UIImage imageNamed:path];
    UIImageView *bubbleImageView = [[UIImageView alloc] initWithImage:[bubble stretchableImageWithLeftCapWidth:floorf((bubble.size.width+20)/2) topCapHeight:(bubble.size.height/2)]];
    UILabel *bubbleText = [[UILabel alloc] initWithFrame:CGRectMake(fromSelf?15.0f:22.0f, 20.0f, size.width+10, size.height+10)];
    bubbleText.backgroundColor = [UIColor clearColor];
    bubbleText.font = font;
    bubbleText.numberOfLines = 0;
    bubbleText.lineBreakMode = NSLineBreakByWordWrapping;
    bubbleText.text = text;
    
    bubbleImageView.frame = CGRectMake(0.0f, 14.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+20.0f);
    
    if(fromSelf)
        returnView.frame = CGRectMake(320-position-(bubbleText.frame.size.width+30.0f), 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    else
        returnView.frame = CGRectMake(position, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
    //底部textField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.origin.x+10, self.view.frame.size.height-40, self.view.frame.size.width-70, 35)];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [textField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [textField.layer setMasksToBounds:YES];
    [textField.layer setCornerRadius:6];
    textField.delegate = self;
    //添加通知。监视键盘是否出现
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoradWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //添加通知，监视键盘消失
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoradWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(textField.frame.size.width+15, textField.frame.origin.y, 50, 35)];
    [sendButton setBackgroundColor:[UIColor clearColor]];
    [sendButton setTitle:@"send" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendButton.layer setMasksToBounds:YES];
    [sendButton.layer setCornerRadius:6];
    [sendButton.layer setBorderWidth:0.5];
    [sendButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [sendButton addTarget:self action:@selector(clickTheSendButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [returnView addSubview:bubbleImageView];
    [returnView addSubview:bubbleText];
    [self.view addSubview:textField];
    [self.view addSubview:sendButton];
    
    return returnView;
}
#pragma mark -- send的点击事件
- (void)clickTheSendButton:(UIButton *)btn{
    
}
#pragma mark -- UITextFieldDelegate
- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark --  调整键盘位置
- (void)keyBoradWillShow:(NSNotification *)noti{
    /*NSDictionary *userInfo = [noti userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyBoradRect = [aValue CGRectValue];
    keyBoradRect = [self.view convertRect:keyBoradRect fromView:nil];
    
    CGFloat keyBoradTop = keyBoradRect.origin.y;
    CGRect newTextFieldFrame = self.view.bounds;
    newTextFieldFrame.size.height = keyBoradTop-self.view.bounds.origin.y;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    textField.frame = newTextFieldFrame;
    [UIView commitAnimations];*/
    
    CGFloat keyboardHight = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat offset = (_tableView.frame.origin.y+_tableView.frame.size.height)-(self.view.frame.size.height-keyboardHight);
    NSValue *animationDurationValue = [[noti userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    if (offset > 0) {
        [UIView animateWithDuration:animationDuration animations:^{
            self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
    
}
#pragma mark -- 键盘消失
- (void)keyBoradWillDisappear:(NSNotification *)noti{
    NSValue *animationDurationValue = [[noti userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [UIView animateWithDuration:animationDuration animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
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
