//
//  UITabBarController+Init.h
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarController (Init)

/// 设置选项卡子控制器
/// @param controllers 控制器集合
/// @Returns UITabBarController实例
+ (instancetype)tabBarWithControllers:(NSArray <UIViewController *> *)controllers;

/// 设置选项卡文字及图片垂直方向位移
/// @param offset 导航栏根控制器
/// @Returns self
- (instancetype)setItemPositionAdjustment:(UIOffset)offset;

/// 设置选项卡阴影线颜色，默认0.5pt
/// @param color 颜色
/// @Returns self
- (instancetype)setTabBarShadowColor:(nullable UIColor *)color;

/// 设置选项卡背景颜色
/// @param color 颜色
/// @Returns self
- (instancetype)setTabBarBackgroundColor:(nullable UIColor *)color;

///  回调给外部的事件，用于调试工具的调用
@property (copy, nonatomic) void (^swipeTabBarCallBack)(UISwipeGestureRecognizer *swipe);

@end

NS_ASSUME_NONNULL_END
