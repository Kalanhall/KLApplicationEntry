//
//  KLTabBarController.m
//  KLApplicationEntry_Example
//
//  Created by Logic on 2020/5/19.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLTabBarController.h"

@interface KLTabBarController () <UITabBarControllerDelegate>

@end

@implementation KLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    if (index == 2) {
        // 凸起按钮事件回调
        if (self.selectedCenterItemCallBack) {
            self.selectedCenterItemCallBack();
        }
    }
    
    return index != 2;
}

@end
