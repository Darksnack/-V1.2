//
//  SettingCell.m
//  设置
//
//  Created by darksnake on 15/11/12.
//  Copyright © 2015年 darksnake. All rights reserved.
//

#import "SettingCell.h"

@implementation SettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpCell];
    }
    return self;
}
#pragma mark -- 配置cell
- (void)setUpCell{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width-10, self.frame.size.height)];
    NSString *path = @"http://101.200.160.247:8080/web/yaoyao.txt";
    NSURL *url = [NSURL URLWithString:path];
    
    [label setText:[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil]];
    label.textAlignment = NSTextAlignmentJustified;
    
    [self addSubview:label];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
