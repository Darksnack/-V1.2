//
//  NetWork.m
//  随手团
//
//  Created by wqeqweweq on 15/11/12.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork
- (instancetype)init{
    self = [super init];
    if (self) {
       
           }
    return self;
}
-(UIImage*)download:(NSString*)str{
    NSString*path=@"http://101.200.160.247:8080/items/pictures/232/grey_icons/";
    NSString*string=[[NSString alloc]init];
    string=[path stringByAppendingString:str];
    NSURL*url=[NSURL URLWithString:string];
    NSLog(@"11111%@",url);

   
    NSData *data = [[NSData    alloc]initWithContentsOfURL:url];
     NSLog(@"21%@",data);
    UIImage*image=[UIImage imageWithData:data];
     NSLog(@"131111%@",image);
    return image;
}
@end
