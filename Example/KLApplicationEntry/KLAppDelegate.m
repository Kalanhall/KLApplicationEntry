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

@implementation KLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [UIWindow.alloc initWithFrame:UIScreen.mainScreen.bounds];
    
    NSArray *controllers =
    @[
    [KLNavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"闲鱼" image:@"tab0-n" selectedImage:@"tab0-s"],
    [KLNavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"鱼塘" image:@"tab1-n" selectedImage:@"tab1-s"],
    [KLNavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"发布" image:@"tab2-n" selectedImage:@"tab2-n"],
    [KLNavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"消息" image:@"tab3-n" selectedImage:@"tab3-s"],
    [KLNavigationController navigationWithRootViewController:KLViewController.new
                                                       title:@"我的" image:@"tab4-n" selectedImage:@"tab4-s"]
    ];
    KLTabBarController *vc = [KLTabBarController tabBarWithControllers:controllers];
    
    // MARK: - 导航栏全局设置
    [KLNavigationController setAppearanceTincolor:UIColor.blackColor];
    [KLNavigationController setAppearanceBarTincolor:UIColor.whiteColor];
    [KLNavigationController setAppearanceBackIndicatorImage:[UIImage imageNamed:@"back"]];
    
    // MARK: - 选项卡全局设置
    // 设置阴影线颜色，当只有设置了背景图后才生效
    [vc setTabBarShadowLineColor:UIColor.clearColor];
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
    // 设置凸起图片高度
    [vc setTabBarItemImageEdgeInsets:(UIEdgeInsets){-17,0,17,0} atIndex:2];
    // 增加一个凸起点击区域
    [vc setTabBarRespondAreaAtIndex:2 height:0];
    
    
    __weak typeof(self) weakself = self;
    vc.swipeTabBarCallBack = ^(UISwipeGestureRecognizer * _Nonnull swipe) {
        if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
            // 右侧划
        } else {
            // 左侧划
        }
    };
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
