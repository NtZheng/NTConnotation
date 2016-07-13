//
//  NTLoginViewController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/12.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTLoginViewController.h"

@interface NTLoginViewController ()

@end

@implementation NTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - methods

// 在iOS7之前是通过UIApplication来统一管理状态栏的，到了iOS7之后，苹果将管理安排到了每个控制器
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent; // 将状态栏的文字变成白色
}

@end
