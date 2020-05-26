//
//  KLTabBarController.m
//  KLApplicationEntry_Example
//
//  Created by Logic on 2020/5/19.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLTabBarController.h"
@import KLApplicationEntry;
@import Lottie;

@interface KLTabBarController () <UITabBarControllerDelegate>

@property (strong, nonatomic) NSArray <LOTAnimationView *> *items;

@end

@implementation KLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

- (void)setupCustomAreaView {
        
    // JSON动画样式
    self.items = @[[LOTAnimationView animationNamed:@"home"],
                   [LOTAnimationView animationNamed:@"category"],
                   [LOTAnimationView animationNamed:@"discover"],
                   [LOTAnimationView animationNamed:@"cart"],
                   [LOTAnimationView animationNamed:@"user"]];

    // 图片高度
    [self addTabBarCustomAreaForeachWithViews:self.items height:0];

    [self.items enumerateObjectsUsingBlock:^(LOTAnimationView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 图片调整（单独设置突出按钮）
//        [self resetTabBarCustomArea:obj extendEdgeInsets:(UIEdgeInsets){idx == 2 ? -20 : 2, 0, 0, 0}];

        obj.tag = idx;
        obj.animationSpeed = 1;
        
        /*
         *****************************************
         这个很重要，设置后响应链才可以还给TabBarItem处理
         否则TabBarItem无法切换，参考
         UITabBar+Init.m 30行代码
         *****************************************
        */
        obj.userInteractionEnabled = NO;
    }];
    
    // 默认首页
    [self.items.firstObject play];
}

- (void)lotanimationTapCallBack:(UITapGestureRecognizer *)tap {
    if (self.shouldSelectViewController) {
        self.shouldSelectViewController(tap.view.tag);
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    [self.items enumerateObjectsUsingBlock:^(LOTAnimationView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (index == idx) {
            [obj play];
        } else {
            [obj stop];
        }
    }];
    
    return YES;
}

@end
