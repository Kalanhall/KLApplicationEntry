//
//  UITabBarController+Init.m
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "UITabBarController+Init.h"
#import <objc/runtime.h>

const NSString *SWIPE_CALLBACK_KEY = @"SWIPE_CALLBACK_KEY";

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
    
    UISwipeGestureRecognizer *swipr = [UISwipeGestureRecognizer.alloc initWithTarget:tc action:@selector(swipGesture:)];
    swipr.direction = UISwipeGestureRecognizerDirectionRight;
    [tc.tabBar addGestureRecognizer:swipr];
    UISwipeGestureRecognizer *swipl = [UISwipeGestureRecognizer.alloc initWithTarget:tc action:@selector(swipGesture:)];
    swipl.direction = UISwipeGestureRecognizerDirectionLeft;
    [tc.tabBar addGestureRecognizer:swipl];
    
    return tc;
}

- (void)swipGesture:(UISwipeGestureRecognizer *)swip {
    if (self.swipeTabBarCallBack) {
        self.swipeTabBarCallBack(swip);
    }
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
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.backgroundImage = [self tab_fetchImageWithColor:color];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.backgroundImage = [self tab_fetchImageWithColor:color];
    }
    return self;
}

- (instancetype)setTabBarShadowLineColor:(UIColor *)color
{
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.shadowImage = [self tab_fetchImageWithColor:color];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.shadowImage = [self tab_fetchImageWithColor:color];
    }
    return self;
}

- (instancetype)setTabBarShadowColor:(nullable UIColor *)color opacity:(CGFloat)opacity
{
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.shadowImage = [self tab_fetchImageWithColor:UIColor.clearColor];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.shadowImage = [self tab_fetchImageWithColor:UIColor.clearColor];
    }
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -2);
    self.tabBar.layer.shadowOpacity = opacity;
    return self;
}

- (void)setSwipeTabBarCallBack:(void (^)(UISwipeGestureRecognizer * _Nonnull))swipeTabBarCallBack {
    objc_setAssociatedObject(self, &SWIPE_CALLBACK_KEY, swipeTabBarCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UISwipeGestureRecognizer * _Nonnull))swipeTabBarCallBack {
    return objc_getAssociatedObject(self, &SWIPE_CALLBACK_KEY);
}

- (UIImage *)tab_fetchImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
