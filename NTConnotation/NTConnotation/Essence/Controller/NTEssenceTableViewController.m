//
//  NTEssenceTableViewController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/6.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTEssenceTableViewController.h"
#import "NTTestViewController.h"

@interface NTEssenceTableViewController ()

@end

@implementation NTEssenceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)test {
    [self.navigationController pushViewController:[[NTTestViewController alloc]init] animated:YES];
}


@end
