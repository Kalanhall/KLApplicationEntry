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
    
    __weak typeof(self) weakself = self;
    self.shouldSelectViewController = ^(NSInteger index) {
        // MARK: Center 模式
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"消息" message:@"点击中间按钮" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
        [alert addAction:sure];
        [weakself presentViewController:alert animated:YES completion:nil];
        
        // MARK: Lottie 模式
//        [weakself.items enumerateObjectsUsingBlock:^(LOTAnimationView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if (index == idx) {
//                [obj play];
//            } else {
//                [obj stop];
//            }
//        }];
    };
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // JSON动画样式
//    self.items = @[[LOTAnimationView animationNamed:@"1"],
//                   [LOTAnimationView animationNamed:@"2"],
//                   [LOTAnimationView animationNamed:@"3"],
//                   [LOTAnimationView animationNamed:@"4"],
//                   [LOTAnimationView animationNamed:@"5"]];
//    
//    [self addTabBarCustomAreaForeachWithViews:self.items height:33];
//    
//    [self.items enumerateObjectsUsingBlock:^(LOTAnimationView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        [self resetTabBarCustomArea:obj extendEdgeInsets:(UIEdgeInsets){idx == 2 ? -20 : 2, 0, 0, 0}];
//        
//        obj.tag = idx;
//        obj.animationSpeed = 0.7;
//        obj.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [UITapGestureRecognizer.alloc initWithTarget:self action:@selector(lotanimationTapCallBack:)];
//        [obj addGestureRecognizer:tap];
//    }];
//    
//    
//    [self.items.firstObject play];
    
    // 系统Item凸起样式
    // Step1 设置图片位置
    [self setTabBarItemImageEdgeInsets:(UIEdgeInsets){-17,0,17,0} atIndex:2];
    // Step2 添加响应区域
    UIButton *center = [UIButton buttonWithType:UIButtonTypeCustom];
    center.tag = 2;
    [center addTarget:self action:@selector(centerTouchInsideCallBack:) forControlEvents:UIControlEventTouchUpInside];
    [self addTabBarCustomAreaWithView:center atIndex:2 height:0];
    [self resetTabBarCustomArea:center extendEdgeInsets:(UIEdgeInsets){-20, 0, 0, 0}];
}

- (void)centerTouchInsideCallBack:(UIButton *)sender {
    if (self.shouldSelectViewController) {
        self.shouldSelectViewController(sender.tag);
    }
}

- (void)lotanimationTapCallBack:(UITapGestureRecognizer *)tap {
    if (self.shouldSelectViewController) {
        self.shouldSelectViewController(tap.view.tag);
    }
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    
    // MARK: - 中间突出按钮回调
    if (index == 2) {
        if (self.shouldSelectViewController) {
            self.shouldSelectViewController(index);
        }
    }

    return index != 2;
    // MARK: - Json动画
//    if (self.shouldSelectViewController) {
//        self.shouldSelectViewController(index);
//    }
//    
//    return YES;
}

@end
