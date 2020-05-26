//
//  KLCenterTabBarController.m
//  KLApplicationEntry_Example
//
//  Created by Logic on 2020/5/26.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLCenterTabBarController.h"
@import KLApplicationEntry;

@interface KLCenterTabBarController ()

@end

@implementation KLCenterTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakself = self;
     self.shouldSelectViewController = ^(NSInteger index) {
         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息" message:@"点击中间按钮" preferredStyle:UIAlertControllerStyleAlert];
         UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
         [alert addAction:sure];
         [weakself presentViewController:alert animated:YES completion:nil];
     };
}

- (void)setupCustomAreaView {
    // 系统Item凸起样式
    // Step1 设置图片位置
    [self setTabBarItemImageEdgeInsets:(UIEdgeInsets){-15,0,15,0} atIndex:2];   // 闲鱼
//    [self setTabBarItemImageEdgeInsets:(UIEdgeInsets){5,0,-5,0} atIndex:2];     // 微博
    // Step2 添加自定义响应区域
    UIButton *center = [UIButton buttonWithType:UIButtonTypeCustom];
    center.tag = 2;
    [center addTarget:self action:@selector(centerTouchInsideCallBack:) forControlEvents:UIControlEventTouchUpInside];
    [self addTabBarCustomAreaWithView:center atIndex:2 height:0];
    [self resetTabBarCustomArea:center extendEdgeInsets:(UIEdgeInsets){-20, 0, 0, 0}]; // 闲鱼

    /*
     *****************************************
     这个很重要，设置YES后，凸起部分才可以将响应链还给
     自身，否则无响应，参考
     UITabBar+Init.m 30行代码
     *****************************************
    */
    center.userInteractionEnabled = YES;
}

- (void)centerTouchInsideCallBack:(UIButton *)sender {
    if (self.shouldSelectViewController) {
        self.shouldSelectViewController(sender.tag);
    }
}

@end
