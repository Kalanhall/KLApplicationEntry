//
//  KLAppDelegate.m
//  KLApplicationEntry
//
//  Created by Kalanhall@163.com on 11/28/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLAppDelegate.h"
#import "KLViewController.h"
#import "KLTabBarController.h"
@import KLApplicationEntry;
@import Lottie;

@implementation KLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSArray *controllers = @[
        [UINavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"" image:@"tab0-n-JSON动效不设置" selectedImage:@"tab0-s-JSON动效不设置"],
        [UINavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"" image:@"tab1-n-JSON动效不设置" selectedImage:@"tab1-s-JSON动效不设置"],
        [UINavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"" image:@"tab2-n-JSON动效不设置" selectedImage:@"tab2-n-JSON动效不设置"],
        [UINavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"" image:@"tab3-n-JSON动效不设置" selectedImage:@"tab3-s-JSON动效不设置"],
        [UINavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"" image:@"tab4-n-JSON动效不设置" selectedImage:@"tab4-s-JSON动效不设置"]
    ];
    
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    KLTabBarController *vc = [KLTabBarController tabBarWithControllers:controllers];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    // MARK: - 导航栏全局设置
    [UINavigationController setAppearanceTincolor:UIColor.blackColor];
    [UINavigationController setAppearanceBarTincolor:UIColor.whiteColor];
    [UINavigationController setAppearanceBackIndicatorImage:[UIImage imageNamed:@"back"]];
    
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
    
    // 设置中间按钮/JSON动效按钮
    [vc setupCustomAreaView];
    
    vc.swipeTabBarCallBack = ^(UISwipeGestureRecognizer * _Nonnull swipe) {
        if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
            // 右侧划
            NSLog(@"向右侧滑");
        } else {
            // 左侧划
            NSLog(@"向左侧滑");
        }
    };
    
    return YES;
}

@end
