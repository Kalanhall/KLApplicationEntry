//
//  KLNavigationController+Init.h
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import KLNavigationController;

NS_ASSUME_NONNULL_BEGIN

@interface KLNavigationController (Init)

/// 用于创建选项卡实例的分类方法
///
/// 具体使用示例如下
///
///     [KLNavigationController navigationWithRootViewController:ViewController.new title:@"商城" image:@"tab0-n" selectedImage:@"tab0-s"]
///
/// @Param rootViewController 导航栏根控制器
/// @Param title 选项卡标题
/// @Param image 选项卡默认图标
/// @Param selectedImage 选项卡选中图标
///
/// @Returns KLNavigationController实例
+ (instancetype)navigationWithRootViewController:(UIViewController *)rootViewController title:(nullable NSString *)title image:(nullable NSString *)image selectedImage:(nullable NSString *)selectedImage;

/// 设置全局导航栏左右按钮主题颜色
+ (void)setAppearanceTincolor:(UIColor *)color;
/// 设置全局导航栏主题颜色
+ (void)setAppearanceBarTincolor:(UIColor *)color;
/// 设置全局导航栏返回图片
+ (void)setAppearanceBackIndicatorImage:(UIImage *)image;
/// 设置全局导航栏标题属性
+ (void)setAppearanceBarTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes;
/// 设置全局导航栏Item属性
+ (void)setAppearanceBarItemTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
