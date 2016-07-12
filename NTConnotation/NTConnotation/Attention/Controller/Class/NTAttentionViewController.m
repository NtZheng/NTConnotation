//
//  NTAttentionViewController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/7.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTAttentionViewController.h"
#import "NTLoginViewController.h"

@interface NTAttentionViewController ()

@end

@implementation NTAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - methods

- (IBAction)loginButtonAction:(id)sender {
    [self presentViewController:[[NTLoginViewController alloc]init] animated:YES completion:^{
        
    }];
}

@end
