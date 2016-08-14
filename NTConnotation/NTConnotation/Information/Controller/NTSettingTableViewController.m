//
//  NTSettingTableViewController.m
//  NTConnotation
//
//  Created by Nineteen on 8/13/16.
//  Copyright © 2016 nineteen. All rights reserved.
//

#import "NTSettingTableViewController.h"
#import "NTCacheTableViewCell.h"

@interface NTSettingTableViewController ()

@end

@implementation NTSettingTableViewController

// 重写了init方法来改变样式
- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[NTCacheTableViewCell class] forCellReuseIdentifier:@"cacheCell"];
}

#pragma mark - dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NTCacheTableViewCell *cell = (NTCacheTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cacheCell"];
        [cell updateStatus];
        return cell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textLabel.text = @"nineteen";
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - delegate


#pragma mark - methods


@end
