//
//  AppDelegate+EAlntroView.m
//  随手团
//
//  Created by wqeqweweq on 15/11/12.
//  Copyright © 2015年 武鹏. All rights reserved.
//

#import "AppDelegate+EAlntroView.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"
@implementation AppDelegate (EAlntroView)
- (void)showIntroWithCrossDissolve{
    EAIntroPage *introPageOne = [EAIntroPage page];
    introPageOne.bgImage = [UIImage imageNamed:@"helpphoto_one.png"];
    
    EAIntroPage *introPageTwo = [EAIntroPage page];
    introPageTwo.bgImage = [UIImage imageNamed:@"helpphoto_two.png"];
    
    EAIntroPage *introPageThree = [EAIntroPage page];
    introPageThree.bgImage = [UIImage imageNamed:@"helpphoto_three.png"];
    
    EAIntroPage *introPageFour = [EAIntroPage page];
    introPageFour.bgImage = [UIImage imageNamed:@"helpphoto_four.png"];
    
    EAIntroPage *introPageFive = [EAIntroPage page];
    introPageFive.bgImage = [UIImage imageNamed:@"helpphoto_five.png"];
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.rootVC.view.bounds andPages:@[introPageOne, introPageTwo, introPageThree, introPageFour, introPageFive]];
    //[intro setBgImage:[UIImage imageNamed:@"Defaultretein1.png"]];
    [intro setDelegate:self];
    [intro showInView:self.rootVC.view animateDuration:0.3];
    
}

@end
