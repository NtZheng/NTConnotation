//
//  NTInformationFooterView.m
//  NTConnotation
//
//  Created by Nineteen on 7/31/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationFooterView.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "NTSquareModel.h"
#import "UIButton+WebCache.h"
#import "NTInformationSquareButton.h"
#import "NTInformationWebViewViewController.h"

@interface NTInformationFooterView()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NTSquareModel *> *allSquares;

@end

@implementation NTInformationFooterView


#pragma mark - 懒加载
- (NSMutableDictionary<NSString *,NTSquareModel *> *)allSquares {
    if (_allSquares == nil) {
        _allSquares = [NSMutableDictionary dictionary];
    }
    return _allSquares;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"square";
        parameters[@"c"] = @"topic";
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
            NSArray *squares = [NTSquareModel mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
            [self creatSquares:squares];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }
    return self;
}

#pragma mark - methods
- (void)creatSquares :(NSArray *)squares {
    int maxColumn = 4;
    CGFloat width = NTScreenWidth/maxColumn;
    CGFloat height = width;
    
    for (int i = 0; i < squares.count; i++) {
        NTSquareModel *model = squares[i];
        
        NTInformationSquareButton *button = [NTInformationSquareButton buttonWithType:UIButtonTypeCustom];
        button.x = (i % maxColumn) * width;
        button.y = (i / maxColumn) * width;
        button.width = width;
        button.height = height;
        [self addSubview:button];
        
        self.allSquares[button.description] = model;
        
        [button setTitle:model.name forState:UIControlStateNormal];
        [button sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_QQ_icon"]];
        [button addTarget:self action:@selector(buttonClickAction: ) forControlEvents:UIControlEventTouchUpInside];
    }
    UITableView *tableView = (UITableView *)self.superview;
    self.height = self.subviews.lastObject.y + self.subviews.lastObject.height;
    tableView.tableFooterView = self;
}

- (void)buttonClickAction: (UIButton *)button {
    NTSquareModel *model = self.allSquares[button.description];
    NSString *URL = model.url;
    if ([URL hasPrefix:@"http"]) {
        NTInformationWebViewViewController *webViewViewController = [[NTInformationWebViewViewController alloc]init];
        webViewViewController.URL = URL;
        webViewViewController.hidesBottomBarWhenPushed = YES;
        UITabBarController *tarBarController = (UITabBarController *)self.window.rootViewController;
        UINavigationController *currentNavigationController = tarBarController.selectedViewController;
        [currentNavigationController pushViewController:webViewViewController animated:YES];
    } else if ([URL hasPrefix:@"mob"]) {
        
    } else {
        
    }
}

@end
