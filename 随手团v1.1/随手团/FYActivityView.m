//
//  FYActivityView.m
//  外卖
//
//  Created by 艾尔 on 15/11/15.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYActivityView.h"

@implementation FYActivityView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    for (NSInteger index = 0; index<2; index++) {
        for (NSInteger line = 0; line<2; line++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width)/2*line, (self.frame.size.height/2)*index, self.frame.size.width/2, self.frame.size.height/2)];
            imageView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
            
            [self addSubview:imageView];
        }

    }
    
}

@end
