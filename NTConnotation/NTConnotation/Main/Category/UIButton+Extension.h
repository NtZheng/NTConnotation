//
//  UIButton+Extension.h
//  NTBlog
//
//  Created by 郑祯 on 15/10/7.
//  Copyright © 2015年 nineteen. All rights reserved.
//

#import <UIKit/UIKit.h>
/* 创建本分类的目的：
 
 由于我们在改变button的各种尺寸属性的时候，都无法直接通过给属性赋值来进行一个改变的操作（具体原因目前没有找到解释）
 所以创建这个分类来简化代码，将取出frame，然后再赋值回去的过程封装在了setter方法中
 
*/

@interface UIButton (Extension)

/* 结构体不是对象类型，所以使用assign */
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end
