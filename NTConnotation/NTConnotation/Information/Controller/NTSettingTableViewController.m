//
//  NTSettingTableViewController.m
//  NTConnotation
//
//  Created by Nineteen on 8/13/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTSettingTableViewController.h"

@interface NTSettingTableViewController ()

@end

@implementation NTSettingTableViewController

// 重写了init方法来改变样式
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"清楚缓存 - %llu",[self getCacheSzie]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - methods
- (unsigned long long)getCacheSzie {
    unsigned long long size = 0;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"default"];
    for (NSString *subPath in [[NSFileManager defaultManager] subpathsAtPath:cachePath]) {
        NSString *fullPath = [cachePath stringByAppendingPathComponent:subPath];
        NSDictionary *attribute = [[NSFileManager defaultManager] attributesOfItemAtPath:fullPath error:nil];
        size += [attribute[NSFileSize] unsignedLongLongValue];
    }
    return size;
}

@end
