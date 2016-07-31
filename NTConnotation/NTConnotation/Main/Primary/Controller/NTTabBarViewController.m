//
//  NTTabBarViewController.m
//  NTConnotation
//
//  Created by 郑祯 on 16/6/28.
//  Copyright © 2016年 nineteen. All rights reserved.
//

#import "NTTabBarViewController.h"
#import "NTTabBar.h"
#import "NTNavigationController.h"
// 四个子控制器
#import "NTEssenceTableViewController.h"
#import "NTLatestTableViewController.h"
#import "NTAttentionViewController.h"
#import "NTInformationTableViewController.h"

@interface NTTabBarViewController ()

@end

@implementation NTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 定制UITabBarItem的样式
    UITabBarItem *item = [UITabBarItem appearance];// 该方法为类方法，会改变所有的样式（但是本项目中仅有一个UITabBarViewController）
    // normal
    NSMutableDictionary *normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttributes[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
    // selected
    NSMutableDictionary *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    selectedAttributes[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    [item setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    
    // 添加各个模板的视图控制器
    NTEssenceTableViewController *essenceTableViewController = [[NTEssenceTableViewController alloc]init];
    [self appendChildViewController:essenceTableViewController title:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    NTLatestTableViewController *latestTableViewController = [[NTLatestTableViewController alloc]init];
    [self appendChildViewController:latestTableViewController title:@"最新" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    NTAttentionViewController *attentionTableViewController = [[NTAttentionViewController alloc]init];
    [self appendChildViewController:attentionTableViewController title:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    NTInformationTableViewController *informationTableViewController = [[NTInformationTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self appendChildViewController:informationTableViewController title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    
    NTTabBar *tabBar = [[NTTabBar alloc]init];
    // 这里由于block内部没有引用self（本视图控制器），那么就不会出现循环引用问题
    tabBar.middleButtonAction = ^{
        NSLog(@"model a view");
    };
    // 更改TabBar为自定义的NTTabBar
    [self setValue:tabBar forKey:@"tabBar"];// 利用KVC机制来赋值系统设定的只读属性
    
}

- (void)appendChildViewController :(UIViewController *)viewController title :(NSString *)title image: (NSString *)image selectedImage :(NSString *)selectedImage {
    
    viewController.tabBarItem.title = title;
    if (image.length) {
        viewController.tabBarItem.image = [UIImage imageNamed:image];
    }
    if (selectedImage.length) {
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];// 改变选中状态下图片的渲染模式（不需要系统进行多余的渲染）
    }
    NTNavigationController *navigationController = [[NTNavigationController alloc]initWithRootViewController:viewController];// 对控制器进行统一的封装，采用统一的导航控制器
    [self addChildViewController:navigationController];
    
}


@end
