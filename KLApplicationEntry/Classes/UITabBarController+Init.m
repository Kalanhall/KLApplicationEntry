//
//  UITabBarController+Init.m
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "UITabBarController+Init.h"

@implementation UITabBarController (Init)

+ (instancetype)tabBarWithControllers:(NSArray <UIViewController *> *)controllers
{
    UITabBarController *tc = UITabBarController.alloc.init;
    tc.view.backgroundColor = UIColor.whiteColor;
    
    tc.viewControllers = controllers;
    
    // MARK: 适配iOS13以下选项卡
    for (UIViewController *vc in tc.viewControllers) {
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.lightGrayColor} forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.blackColor} forState:UIControlStateSelected];
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-3, 0, 3, 0);
    }

    // MARK: 适配iOS13选项卡
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = tc.tabBar.standardAppearance.copy;
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName : UIColor.lightGrayColor};
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{NSForegroundColorAttributeName : UIColor.blackColor};
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffsetMake(0, -3);
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffsetMake(0, -3);
        tc.tabBar.standardAppearance = appearance;
    }
    return tc;
}

- (instancetype)setItemPositionAdjustment:(UIOffset)offset
{
    // MARK: 适配iOS13以下选项卡
    for (UIViewController *vc in self.viewControllers) {
        vc.tabBarItem.titlePositionAdjustment = offset;
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(offset.vertical, offset.horizontal, -offset.vertical, -offset.horizontal);
    }
    
    // MARK: 适配iOS13选项卡
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = offset;
        appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = offset;
        self.tabBar.standardAppearance = appearance;
    }
    return self;
}

- (instancetype)setTabBarBackgroundColor:(UIColor *)color
{
    self.tabBar.backgroundImage = [self tab_fetchImageWithColor:color];
    return self;
}

- (instancetype)setTabBarShadowColor:(UIColor *)color
{
    self.tabBar.shadowImage = [self tab_fetchImageWithColor:color];
    return self;
}

- (UIImage *)tab_fetchImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 0.5, 0.5);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
