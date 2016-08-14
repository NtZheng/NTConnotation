//
//  NTCacheTableViewCell.m
//  NTConnotation
//
//  Created by Nineteen on 8/14/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTCacheTableViewCell.h"
#import <SVProgressHUD.h>
#import "SDImageCache.h"

/** 缓存路径 */
#define cacheFile [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"custom"]

static NSString* const defaultText = @"清除缓存";

@implementation NTCacheTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.text = defaultText;
        
        // 禁止点击事件
        self.userInteractionEnabled = NO;
        
        // 右边显示圈圈
        UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [loadingView startAnimating];
        self.accessoryView = loadingView;
        
        // 计算大小
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            // 计算缓存大小
            NSInteger size = cacheFile.fileSize + [SDImageCache sharedImageCache].getSize;
            double unit = 1000.0;
            NSString *sizeText = nil;
            if (size >= pow(unit, 3)) { // GB
                sizeText = [NSString stringWithFormat:@"%.1fGB", size / pow(unit, 3)];
            } else if (size >= pow(unit, 2)) { // MB
                sizeText = [NSString stringWithFormat:@"%.1fMB", size / unit / unit];
            } else if (size >= pow(unit, 1)) { // 1KB
                sizeText = [NSString stringWithFormat:@"%.1fKB", size / unit];
            } else { // B
                sizeText = [NSString stringWithFormat:@"%zdB", size];
            }
            NSString *text = [NSString stringWithFormat:@"%@(%@)", defaultText, sizeText];
            
#warning sleep
            [NSThread sleepForTimeInterval:2.0];
            
            // 如果在计算大小的时候点了返回，则是代码不继续进行
            __weak typeof(self) weakSelf = self;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (weakSelf == nil) return;
                weakSelf.textLabel.text = text;
                weakSelf.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                weakSelf.accessoryView = nil;
                // 允许点击事件
                weakSelf.userInteractionEnabled = YES;
            });
        });
        
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction)]];

    }
    return self;
}

- (void)updateStatus
{
    if (self.accessoryView == nil) return;
    // 让圈圈继续旋转
    UIActivityIndicatorView *loadingView = (UIActivityIndicatorView *)self.accessoryView;
    [loadingView startAnimating];
}

- (void)clickAction
{
    [SVProgressHUD showWithStatus:@"清除缓存中..."];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [[NSFileManager defaultManager] removeItemAtPath:cacheFile error:nil];
            [[NSFileManager defaultManager] createDirectoryAtPath:cacheFile withIntermediateDirectories:YES attributes:nil error:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                
#warning sleep
                [NSThread sleepForTimeInterval:2.0];
                
                [SVProgressHUD dismiss];
                self.textLabel.text = defaultText;
                self.userInteractionEnabled = NO;
            });
        });
    }];
}


@end
