//
//  KLNavigationController+Init.m
//  Objective-C
//
//  Created by Logic on 2019/11/28.
//  Copyright © 2019 Kalan. All rights reserved.
//

#import "KLNavigationController+Init.h"

@implementation KLNavigationController (Init)

+ (instancetype)navigationWithRootViewController:(UIViewController *)rootViewController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    KLNavigationController *nc = [KLNavigationController.alloc initWithRootViewController:rootViewController];
    UIImage *normal = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *select = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nc.tabBarItem = [UITabBarItem.alloc initWithTitle:title image:normal selectedImage:select];
    return nc;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

+ (void)navigationGlobalTincolor:(UIColor *)color
{
    UINavigationBar.appearance.tintColor = UIColor.blackColor;
}

+ (void)navigationGlobalBarTincolor:(UIColor *)color
{
    UINavigationBar.appearance.barTintColor = UIColor.whiteColor;
}

+ (void)navigationGlobalBackIndicatorImage:(UIImage *)image
{
    // 导航栏全局返回图片处理，位置只能在控制器中对UIBarButtonItem.imageInsets进行调整
    UINavigationBar.appearance.backIndicatorImage = image;
    UINavigationBar.appearance.backIndicatorTransitionMaskImage = image;
}

+ (void)navigationGlobalBarButtonItemTitleTextColor:(UIColor *)color font:(nullable UIFont *)font
{
    UIBarButtonItem *tbappearance = UIBarButtonItem.appearance;
    // MARK: 导航栏全局按钮文字颜色设置，iOS13.1不起作用
    [tbappearance setTitleTextAttributes:@{NSForegroundColorAttributeName : color,
                                           NSFontAttributeName : font ? : [UIFont systemFontOfSize:14]}
                                forState:UIControlStateNormal];
    [tbappearance setTitleTextAttributes:@{NSForegroundColorAttributeName : color,
                                           NSFontAttributeName : font ? : [UIFont systemFontOfSize:14]}
                                forState:UIControlStateHighlighted];
}

@end
