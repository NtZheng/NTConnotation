//
//  NTInformationFooterView.m
//  NTConnotation
//
//  Created by Nineteen on 7/31/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTInformationFooterView.h"
#import "AFNetworking.h"

@implementation NTInformationFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        parameters[@"a"] = @"square";
        parameters[@"c"] = @"topic";
        
        [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary*  _Nullable responseObject) {
            [responseObject writeToFile:@"/Users/Nineteen/Desktop/me.plist" atomically:YES];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }
    return self;
}

@end
