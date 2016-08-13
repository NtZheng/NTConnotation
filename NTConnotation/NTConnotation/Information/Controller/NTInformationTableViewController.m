//
//  NTInformationTableViewController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/7/6.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTInformationTableViewController.h"
#import "NTInformationTableViewCell.h"
#import "NTInformationFooterView.h"
#import "NTSettingTableViewController.h"

@interface NTInformationTableViewController ()

@end

@implementation NTInformationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[NTInformationFooterView alloc]init];
    
    // 导航栏右边的内容
    UIBarButtonItem *moonItem = [UIBarButtonItem barButtonItemWithTarget:self method:@selector(moonClickAction) image:@"mine-moon-icon" highlightedImage:@"mine-moon-icon-click"];
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithTarget:self method:@selector(settingClickAction) image:@"mine-setting-icon" highlightedImage:@"mine-setting-icon-click"];
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
}

#pragma mark - dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NTInformationTableViewCell *cell = [[NTInformationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"publish-audio"];
        cell.textLabel.text = @"登录/注册";
    } else if (indexPath.section == 1) {
        cell.textLabel.text = @"离线下载";
        cell.imageView.image = nil;
    } else {
        
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    } else {
        return 0.02;
    }
}

#pragma mark - methods
- (void)moonClickAction {
    
}

- (void)settingClickAction {
    [self.navigationController pushViewController:[[NTSettingTableViewController alloc]init] animated:YES];
}

@end
