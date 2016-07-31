//
//  NTTextField.m
//  NTConnotation
//
//  Created by Nineteen on 7/30/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTTextField.h"

@implementation NTTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    [self addTarget:self action:@selector(beginEditAction) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(endEditAction) forControlEvents:UIControlEventEditingDidEnd];
}

#pragma mark - methods
- (void)beginEditAction {
    NSMutableDictionary *attributeDictionary = [NSMutableDictionary dictionary];
    attributeDictionary[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:attributeDictionary];
}

- (void)endEditAction {
    NSMutableDictionary *attributeDictionary = [NSMutableDictionary dictionary];
    attributeDictionary[NSForegroundColorAttributeName] = [UIColor grayColor];
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:attributeDictionary];
}

@end
