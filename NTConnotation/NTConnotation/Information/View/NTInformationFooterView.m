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

@implementation NTInformationFooterView

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
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.x = (i % maxColumn) * width;
        button.y = (i / maxColumn) * width;
        button.width = width;
        button.height = height;
        [self addSubview:button];
        
        [button setTitle:model.name forState:UIControlStateNormal];
        [button sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"login_QQ_icon"]];
        [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    }
    UITableView *tableView = (UITableView *)self.superview;
    self.height = self.subviews.lastObject.y + self.subviews.lastObject.height;
    tableView.tableFooterView = self;
}

- (void)test {
    NSLog(@"1");
}

@end
