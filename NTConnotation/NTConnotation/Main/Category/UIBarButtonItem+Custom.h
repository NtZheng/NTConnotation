//
//  UIBarButtonItem+Custom.h
//  NTConnotation
//
//  Created by 郑祯 on 16/7/6.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Custom)

+ (instancetype)barButtonItemWithTarget :(id)target method :(SEL)method image :(NSString *)image highlightedImage :(NSString *)highlightedImage;

@end
