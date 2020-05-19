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

/// 设置选项卡子控制器标题颜色
/// @param titleTextAttributes 文本属性
/// @param state 状态
- (void)setTabBarItemTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes forState:(UIControlState)state;

/// 设置选项卡子控制器标题位移
/// @param offset 文本位移
/// @param state 状态
- (void)setTabBarItemTitlePositionAdjustment:(UIOffset)offset forState:(UIControlState)state;

/// 设置选项卡指定子控制器标题位移
/// @param imageEdgeInsets 图片边距位移
- (void)setTabBarItemImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

/// 设置选项卡指定子控制器标题位移
/// @param imageEdgeInsets 图片边距位移
/// @param index 指定Item
- (void)setTabBarItemImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets atIndex:(NSInteger)index;

/// 设置选项卡背景颜色
/// @param color 颜色
- (void)setTabBarBackgroundImageWithColor:(nullable UIColor *)color;

/// 设置选项卡阴影线颜色，默认0.5pt
/// 必须设置背景图片后才生效
/// @param color 颜色
- (void)setTabBarShadowLineColor:(nullable UIColor *)color;

/// 设置TabBar阴影
/// 必须设置背景图片后才生效
/// @param color 阴影颜色
/// @param opacity 阴影透明度
- (void)setTabBarShadowColor:(nullable UIColor *)color opacity:(CGFloat)opacity;

///  回调给外部的事件，用于调试工具的调用
@property (copy, nonatomic) void (^swipeTabBarCallBack)(UISwipeGestureRecognizer *swipe);

@end

NS_ASSUME_NONNULL_END
