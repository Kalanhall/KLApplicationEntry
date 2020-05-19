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
    UITabBarController *tc = [[self alloc] init];
    tc.viewControllers = controllers;
    
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

- (void)setTabBarItemTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes forState:(UIControlState)state {
    if (@available(iOS 13.0, *)) {
        // MARK: 适配iOS13选项卡
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        if (state == UIControlStateNormal) {
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = titleTextAttributes;
        } else {
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = titleTextAttributes;
        }
        self.tabBar.standardAppearance = appearance;
    } else {
        // MARK: 适配iOS13以下选项卡
        for (UIViewController *vc in self.viewControllers) {
            [vc.tabBarItem setTitleTextAttributes:titleTextAttributes forState:state];
        }
    }
}

- (void)setTabBarItemTitlePositionAdjustment:(UIOffset)offset forState:(UIControlState)state {
    if (@available(iOS 13.0, *)) {
        // MARK: 适配iOS13选项卡
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        if (state == UIControlStateNormal) {
            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = offset;
        } else {
            appearance.stackedLayoutAppearance.selected.titlePositionAdjustment = offset;
        }
        self.tabBar.standardAppearance = appearance;
    } else {
        // MARK: 适配iOS13以下选项卡
        for (UIViewController *vc in self.viewControllers) {
            vc.tabBarItem.titlePositionAdjustment = offset;
        }
    }
}

- (void)setTabBarItemImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    for (UIViewController *vc in self.viewControllers) {
        vc.tabBarItem.imageInsets = imageEdgeInsets;
    }
}

- (void)setTabBarItemImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets atIndex:(NSInteger)index {
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == index) {
            obj.tabBarItem.imageInsets = imageEdgeInsets;
        }
    }];
}

- (void)setTabBarBackgroundImageWithColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.backgroundImage = [self tab_fetchImageWithColor:color];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.backgroundImage = [self tab_fetchImageWithColor:color];
    }
}

- (void)setTabBarShadowLineColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = self.tabBar.standardAppearance.copy;
        appearance.shadowImage = [self tab_fetchImageWithColor:color];
        self.tabBar.standardAppearance = appearance;
    } else {
        self.tabBar.shadowImage = [self tab_fetchImageWithColor:color];
    }
}

- (void)setTabBarShadowColor:(nullable UIColor *)color opacity:(CGFloat)opacity
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
