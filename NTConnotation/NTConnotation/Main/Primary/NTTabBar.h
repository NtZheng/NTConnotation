//
//  NTTabBar.h
//  NTConnotation
//
//  Created by 郑祯 on 16/6/29.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTTabBar : UITabBar

@property (nonatomic, strong) UIButton *middleButton;
// 定义block用于middleButton的点击事件的传递
@property (nonatomic, copy) void (^middleButtonAction)(void);


@end
