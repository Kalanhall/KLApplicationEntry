//
//  KLTabBarController.m
//  KLApplicationEntry_Example
//
//  Created by Logic on 2020/5/19.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLTabBarController.h"
@import KLApplicationEntry;

@interface KLTabBarController () <UITabBarControllerDelegate>

@end

@implementation KLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    // 凸起按钮事件回调
    __weak typeof(self) weakself = self;
    
    self.shouldSelectViewController = ^(NSInteger index) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息" message:@"点击中间按钮" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:sure];
        [weakself presentViewController:alert animated:YES completion:nil];
    };
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (index == 2) {
        if (self.shouldSelectViewController) {
            self.shouldSelectViewController(index);
        }
    }
    
    return index != 2;
}

@end
