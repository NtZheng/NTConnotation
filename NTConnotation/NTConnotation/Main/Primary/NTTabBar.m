//
//  NTTabBar.m
//  NTConnotation
//
//  Created by 郑祯 on 16/6/29.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTTabBar.h"

@implementation NTTabBar

- (void)layoutSubviews {
    [super layoutSubviews];
    int width = [UIScreen mainScreen].bounds.size.width / 5;
    int index = 0;
    // 重新定制TabBar的每个TabBarItem的frame
    for (UIView *subView in self.subviews) {
        if (subView.class != NSClassFromString(@"UITabBarButton")) continue;// 由于UITabBarButton这个类是私有类，所以用NSClassFromString来访问
        subView.size = CGSizeMake(width, self.height);
        if (index >= 2) {
            subView.origin = CGPointMake(width*index+width, 0);
        } else {
            subView.origin = CGPointMake(width*index, 0);
        }
        index++;
    }
    // 添加中间的button
    self.middleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.middleButton.frame = CGRectMake(width*2, 0, width, self.height);
    // 由于美工把图片已经设置好大小，所以对button设置image就好了
    [self.middleButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [self.middleButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [self.middleButton addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.middleButton];
}

#pragma mark - methods
- (void)clickAction {
    self.middleButtonAction();// 回调block
}

@end
