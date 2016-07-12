//
//  NTQuickLoginButton.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/12.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTQuickLoginButton.h"

@implementation NTQuickLoginButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 在对于imageView和titleLabel都没有设置高度，因为它们可以根据图片和文字来自动调整大小
    self.imageView.y = 0;
    self.imageView.centerX = self.width * 0.5;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.y + self.imageView.height;
    self.titleLabel.width = self.width;
}

@end
