//
//  FYFunctionView.m
//  外卖
//
//  Created by 艾尔 on 15/11/11.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYFunctionView.h"


@implementation FYFunctionView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    for (NSInteger index = 0; index<2; index++) {
        for (NSInteger line = 0; line<4; line++) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(line*self.frame.size.width/4, index*100, self.frame.size.width/4, 100)];
            [btn imageRectForContentRect:CGRectMake(50, 0, 50, 50)];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"Snip20151110_%ld.png", 22+(4*index)+line]] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            btn.tag = 100+(4*index)+line;
            [btn addTarget:self action:@selector(functionButtonIncident:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, btn.frame.size.width, 20)];
            switch ((4*index)+line) {
                case 0:
                    label.text = @"美食";
                    break;
                case 1:
                    label.text = @"超市";
                    break;
                case 2:
                    label.text = @"鲜果购";
                    break;
                case 3:
                    label.text = @"甜点饮品";
                    break;
                case 4:
                    label.text = @"土豪馆";
                    break;
                case 5:
                    label.text = @"专送";
                    break;
                case 6:
                    label.text = @"鲜花蛋糕";
                    break;
                default:
                    label.text = @"送药上门";
                    break;
            }
            [label setTextAlignment:NSTextAlignmentCenter];
            [btn addSubview:label];
        }
    }
}

- (void)functionButtonIncident:(UIButton *)sender{
    FYFunctionDetailViewController *functionDetailVC = [[FYFunctionDetailViewController alloc] init];
    switch (sender.tag) {
        case 100:
            functionDetailVC.functionName = @"美食";
            break;
        case 101:
            functionDetailVC.functionName = @"超市";
            break;
        case 102:
            functionDetailVC.functionName = @"鲜果购";
            break;
        case 103:
            functionDetailVC.functionName = @"甜点饮品";
            break;
        case 104:
            functionDetailVC.functionName = @"土豪馆";
            break;
        case 105:
            functionDetailVC.functionName = @"专送";
            break;
        case 106:
            functionDetailVC.functionName = @"鲜花蛋糕";
            break;
        default:
            functionDetailVC.functionName = @"送药上门";
            break;
    }
    if (self.gotoFunctionDetailVC) {
        self.gotoFunctionDetailVC(functionDetailVC);
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
