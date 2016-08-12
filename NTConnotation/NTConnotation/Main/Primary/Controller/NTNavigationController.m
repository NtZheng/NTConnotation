//
//  NTNavigationController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/6.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTNavigationController.h"

@interface NTNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation NTNavigationController


+ (void)initialize {
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault]; //防止出现跳转过程中的阴影（那是由于UINavigation自己的问题造成，由于是半透明的，所以跳转过程中出现叠加则会变成阴影）
    
    // 设置title的属性
    NSMutableDictionary *titleAttributes = [NSMutableDictionary dictionary];
    titleAttributes[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [navigationBar setTitleTextAttributes:titleAttributes];
    
    /*
    // 设置UIBarButtonItem的属性
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    NSMutableDictionary *barButtonItemNormalAttributes = [NSMutableDictionary dictionary];
    barButtonItemNormalAttributes[NSForegroundColorAttributeName] = [UIColor blackColor];
    barButtonItemNormalAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [barButtonItem setTitleTextAttributes:barButtonItemNormalAttributes forState:UIControlStateNormal];
    NSMutableDictionary *barButtonItemDisabledAttributes = [NSMutableDictionary dictionary];
    barButtonItemDisabledAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    [barButtonItem setTitleTextAttributes:barButtonItemDisabledAttributes forState:UIControlStateDisabled];
     */
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:YES];
    if (self.viewControllers.count == 1) { //对于根视图控制器的操作
        
    } else {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        // 下面两句代码一定要按照这个顺序放，同时应该放在title和image设置完成以后
        [button sizeToFit];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
    
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count == 1) { //当为根视图控制器的时候
        return NO;
    } else {
        return YES;
    }
}






@end
