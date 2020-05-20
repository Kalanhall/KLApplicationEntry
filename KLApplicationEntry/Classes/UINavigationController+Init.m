//
//  UINavigationController+Init.m
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "UINavigationController+Init.h"

@implementation UINavigationController (Init)

+ (instancetype)navigationWithRootViewController:(UIViewController *)rootViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    UINavigationController *nc = [self.alloc initWithRootViewController:rootViewController];
    UIImage *normal = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *select = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nc.tabBarItem = [UITabBarItem.alloc initWithTitle:title image:normal selectedImage:select];
    return nc;
}

+ (void)setAppearanceTincolor:(UIColor *)color {
    UINavigationBar.appearance.tintColor = color;
}

+ (void)setAppearanceBarTincolor:(UIColor *)color {
    UINavigationBar.appearance.barTintColor = color;
}

+ (void)setAppearanceBackIndicatorImage:(UIImage *)image {
    // 导航栏全局返回图片处理，位置只能在控制器中对UIBarButtonItem.imageInsets进行调整
    UINavigationBar.appearance.backIndicatorImage = image;
    UINavigationBar.appearance.backIndicatorTransitionMaskImage = image;
}

+ (void)setAppearanceBarTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes {
    [UINavigationBar.appearance setTitleTextAttributes:titleTextAttributes];
}

+ (void)setAppearanceBarItemTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes forState:(UIControlState)state {
    [UIBarButtonItem.appearance setTitleTextAttributes:titleTextAttributes forState:state];
}

@end
