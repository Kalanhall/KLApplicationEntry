//
//  KLViewController.m
//  KLApplicationEntry
//
//  Created by Kalanhall@163.com on 11/28/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
@import KLApplicationEntry;
#import "KLTabBarController.h"
#import "KLCenterController.h"
#import "KLCenterTabBarController.h"

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:nil forState:0];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *controllers = @[
        [UINavigationController navigationWithRootViewController:KLCenterController.new
                                                       title:@"闲鱼" image:@"tab0-n" selectedImage:@"tab0-s"],
        [UINavigationController navigationWithRootViewController:KLCenterController.new
                                                       title:@"鱼塘" image:@"tab1-n" selectedImage:@"tab1-s"],
        [UINavigationController navigationWithRootViewController:KLCenterController.new
                                                       title:@"发布" image:@"tab2-n" selectedImage:@"tab2-n"], // 闲鱼
//        [UINavigationController navigationWithRootViewController:KLCenterController.new
//                                                       title:@"" image:@"vip" selectedImage:@"vip"],            // 微博
        [UINavigationController navigationWithRootViewController:KLCenterController.new
                                                       title:@"消息" image:@"tab3-n" selectedImage:@"tab3-s"],
        [UINavigationController navigationWithRootViewController:KLCenterController.new
                                                       title:@"我的" image:@"tab4-n" selectedImage:@"tab4-s"]
    ];
    
    KLCenterTabBarController *vc = [KLCenterTabBarController tabBarWithControllers:controllers];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
    // MARK: - 选项卡全局设置
    // 设置阴影线颜色，当只有设置了背景图后才生效
    [vc setTabBarShadowLineColor:UIColor.clearColor];
    // 选项卡阴影
    [vc setTabBarShadowColor:UIColor.blackColor opacity:0.1];
    // 设置背景图片
    [vc setTabBarBackgroundImageWithColor:UIColor.whiteColor];
    // 设置文字样式
    [vc setTabBarItemTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor,
                                           NSFontAttributeName : [UIFont systemFontOfSize:10]}
                                forState:UIControlStateNormal];
    [vc setTabBarItemTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor,
                                           NSFontAttributeName : [UIFont systemFontOfSize:10]}
                                forState:UIControlStateHighlighted];
    // 设置文字位置偏移量
    [vc setTabBarItemTitlePositionAdjustment:(UIOffset){0, -2} forState:UIControlStateNormal];
    [vc setTabBarItemTitlePositionAdjustment:(UIOffset){0, -2} forState:UIControlStateSelected];
    // 设置凸起按钮
    [vc setupCustomAreaView];
}

@end
