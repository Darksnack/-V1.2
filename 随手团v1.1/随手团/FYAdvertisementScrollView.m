//
//  FYAdvertisementScrollView.m
//  外卖
//
//  Created by 艾尔 on 15/11/11.
//  Copyright © 2015年 艾尔. All rights reserved.
//

#import "FYAdvertisementScrollView.h"

@interface FYAdvertisementScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *infoArray;

@property (nonatomic, strong) NSMutableArray *imageArray;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger index;

//声明pageControl属性
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation FYAdvertisementScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _imageArray = [[NSMutableArray alloc] initWithCapacity:0];
        [self createPageControl];
        _index = 0;
    }
    [self setUpView];
    return self;
}

- (void)setUpView{
    //滚动范围
    [self setContentSize:CGSizeMake(self.frame.size.width*(_imageArray.count+2), 0)];
    //关闭弹簧效果
    [self setBounces:NO];
    //运行滚动
    [self setScrollEnabled:YES];
    //隐藏滚动条
    [self setShowsHorizontalScrollIndicator:NO];
    [self setShowsVerticalScrollIndicator:NO];
    //判读是否分页
    [self setPagingEnabled:YES];
    
    //添加图片
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger index = 0; index<4; index++) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://101.200.160.247:8080/items/pictures/ours/lunbo%ld.jpg", index+1]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        [array addObject:image];
    }
    
    for (NSInteger index = 0; index<array.count; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:array[index]];
        [_imageArray addObject:imageView];
    }
    UIImageView *endImageView = [[UIImageView alloc] initWithImage:array[0]];
    [_imageArray addObject:endImageView];
    
    [_imageArray enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setFrame:CGRectMake(idx*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:obj];
    }];
    
    //自动滚动
    //创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(changeAdvertisement) userInfo:nil repeats:YES];
}

- (void)changeAdvertisement{
    NSInteger index = self.contentOffset.x/self.frame.size.width+1;
    
    if (index==5) {
        index = 0;
        [self setContentOffset:CGPointMake(0, 0)];
    }
    else{
        [self setContentOffset:CGPointMake(index*(self.frame.size.width), 0) animated:YES];
    }
    _pageControl.currentPage = index;
}

#pragma mark -- 创建并配置pageControl
- (void)createPageControl{
    _pageControl = [[UIPageControl alloc] init];
    [_pageControl setNumberOfPages:_imageArray.count];
    CGSize controlSize = [_pageControl sizeForNumberOfPages:_imageArray.count];
    _pageControl.frame = CGRectMake((self.frame.size.width-controlSize.width)/2, self.frame.size.height-controlSize.height, controlSize.width, controlSize.height);
    [self addSubview:_pageControl];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
