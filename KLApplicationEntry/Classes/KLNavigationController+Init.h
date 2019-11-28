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
///     [KLNavigationController navigationWithRootViewController:ViewController.new title:@"商城" image:@"Tab0" selectedImage:@"Tab0-h"]
///
/// @Param rootViewController 导航栏根控制器
/// @Param title 选项卡标题
/// @Param image 选项卡默认图标
/// @Param selectedImage 选项卡选中图标
///
/// @Returns KLNavigationController实例
+ (instancetype)navigationWithRootViewController:(UIViewController *)rootViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage;

/// 设置全局导航栏左右按钮主题颜色
+ (void)navigationGlobalTincolor:(UIColor *)color;
/// 设置全局导航栏主题颜色
+ (void)navigationGlobalBarTincolor:(UIColor *)color;
/// 设置全局导航栏返回图片
+ (void)navigationGlobalBackIndicatorImage:(UIImage *)image;

/// 设置全局导航栏左右按钮文字颜色及大小
///
/// 方法使用描述，设置颜色后，导致系统创建的导航栏leftItem，rightItem文字为透明，使用customView的初始化方式可以避免
///
///     [KLNavigationController navigationGlobalBarButtonItemTitleTextColor:UIColor.clearColor font:nil];
///
/// @Param color 文字颜色
/// @Param font 文字大小
///
+ (void)navigationGlobalBarButtonItemTitleTextColor:(UIColor *)color font:(nullable UIFont *)font;

@end

NS_ASSUME_NONNULL_END
