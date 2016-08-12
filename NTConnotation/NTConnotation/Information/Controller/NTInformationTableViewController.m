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

@interface NTInformationTableViewController ()

@end

@implementation NTInformationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[NTInformationFooterView alloc]init];
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

@end
