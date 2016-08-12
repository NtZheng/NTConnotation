//
//  NTInformationSquareButton.m
//  NTConnotation
//
//  Created by Nineteen on 8/12/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationSquareButton.h"

@implementation NTInformationSquareButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageView.y = self.height * 0.15;
    self.imageView.height = self.height * 0.5;
    self.imageView.width = self.imageView.height;
    self.imageView.centerX = self.width * 0.5;
    
    
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + self.imageView.y;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.imageView.height;
}

@end
