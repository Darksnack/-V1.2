//
//  FYNavButton.m
//  外卖
//
//  Created by 艾尔 on 15/11/10.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYNavButton.h"

@implementation FYNavButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 44)];
    [imageView setImage:[UIImage imageNamed:@"pin.png"]];
    [self addSubview:imageView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width+imageView.frame.origin.x+10, 0, 90, 44)];
    [label setTextAlignment:NSTextAlignmentCenter];
    label.text = @"沈阳";
    label.textColor = [UIColor orangeColor];
    _siteNameLabel = label;
    [self addSubview:_siteNameLabel];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(label.frame.size.width+label.frame.origin.x, 0, self.frame.size.width-label.frame.size.width-label.frame.origin.x, 44)];
    [imageView1 setImage:[UIImage imageNamed:@"right.png"]];
    [self addSubview:imageView1];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
