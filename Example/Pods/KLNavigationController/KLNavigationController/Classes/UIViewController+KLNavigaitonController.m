//
//  UIViewController+KLNavigationController.m
//  KLNavigationBar
//
//  Created by Kalan on 2018/3/23.
//

#import "UIViewController+KLNavigaitonController.h"
#import <objc/runtime.h>
#import "KLNavigationController.h"

@implementation UIViewController (KLNavigationController)

- (BOOL)kl_blackBarStyle {
    return self.kl_barStyle == UIBarStyleBlack;
}

- (void)setKl_blackBarStyle:(BOOL)kl_blackBarStyle {
    self.kl_barStyle = kl_blackBarStyle ? UIBarStyleBlack : UIBarStyleDefault;
}

- (UIBarStyle)kl_barStyle {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (obj) {
        return [obj integerValue];
    }
    return [UINavigationBar appearance].barStyle;
}

- (void)setKl_barStyle:(UIBarStyle)kl_barStyle {
    objc_setAssociatedObject(self, @selector(kl_barStyle), @(kl_barStyle), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)kl_barTintColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setKl_barTintColor:(UIColor *)tintColor {
     objc_setAssociatedObject(self, @selector(kl_barTintColor), tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)kl_barImage {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setKl_barImage:(UIImage *)image {
    objc_setAssociatedObject(self, @selector(kl_barImage), image, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)kl_tintColor {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ?: [UINavigationBar appearance].tintColor;
}

- (void)setKl_tintColor:(UIColor *)tintColor {
    objc_setAssociatedObject(self, @selector(kl_tintColor), tintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)kl_titleTextAttributes {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ?: [UINavigationBar appearance].titleTextAttributes;
}

- (void)setKl_titleTextAttributes:(NSDictionary *)attributes {
    objc_setAssociatedObject(self, @selector(kl_titleTextAttributes), attributes, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (float)kl_barAlpha {
    id obj = objc_getAssociatedObject(self, _cmd);
    if (self.kl_barHidden) {
        return 0;
    }
    return obj ? [obj floatValue] : 1.0f;
}

- (void)setKl_barAlpha:(float)alpha {
    objc_setAssociatedObject(self, @selector(kl_barAlpha), @(alpha), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)kl_barHidden {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : NO;
}

- (void)setKl_barHidden:(BOOL)hidden {
    if (hidden) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
        self.navigationItem.titleView = [UIView new];
    } else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.titleView = nil;
    }
    objc_setAssociatedObject(self, @selector(kl_barHidden), @(hidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)kl_barShadowHidden {
    id obj = objc_getAssociatedObject(self, _cmd);
    return  self.kl_barHidden || obj ? [obj boolValue] : NO;
}

- (void)setKl_barShadowHidden:(BOOL)hidden {
    objc_setAssociatedObject(self, @selector(kl_barShadowHidden), @(hidden), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)kl_barShadowColor {
    id obj = objc_getAssociatedObject(self, _cmd);
    return  obj;
}

- (void)setKl_barShadowColor:(UIColor *)kl_barShadowColor {
    self.kl_barShadowHidden = YES;
    self.navigationController.navigationBar.layer.shadowColor = kl_barShadowColor.CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 2);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.2;
    objc_setAssociatedObject(self, @selector(kl_barShadowColor), kl_barShadowColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)kl_backInteractive {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

-(void)setKl_backInteractive:(BOOL)interactive {
    objc_setAssociatedObject(self, @selector(kl_backInteractive), @(interactive), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)kl_swipeBackEnabled {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

- (void)setKl_swipeBackEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(kl_swipeBackEnabled), @(enabled), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)kl_clickBackEnabled {
    id obj = objc_getAssociatedObject(self, _cmd);
    return obj ? [obj boolValue] : YES;
}

- (void)setKl_clickBackEnabled:(BOOL)enabled {
    objc_setAssociatedObject(self, @selector(kl_clickBackEnabled), @(enabled), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (float)kl_computedBarShadowAlpha {
    return  self.kl_barShadowHidden ? 0 : self.kl_barAlpha;
}

- (UIImage *)kl_computedBarImage {
    UIImage *image = self.kl_barImage;
    if (!image) {
        if (self.kl_barTintColor) {
            return nil;
        }
        return [[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault];
    }
    return image;
}

- (UIColor *)kl_computedBarTintColor {
    if (self.kl_barImage) {
        return nil;
    }
    UIColor *color = self.kl_barTintColor;
    if (!color) {
        if ([[UINavigationBar appearance] backgroundImageForBarMetrics:UIBarMetricsDefault]) {
            return nil;
        }
        if ([UINavigationBar appearance].barTintColor) {
            color = [UINavigationBar appearance].barTintColor;
        } else {
            color = [UINavigationBar appearance].barStyle == UIBarStyleDefault ? [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:0.8]: [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:0.729];
        }
    }
    return color;
}

- (void)kl_setNeedsUpdateNavigationBar {
    if (self.navigationController && [self.navigationController isKindOfClass:[KLNavigationController class]]) {
        KLNavigationController *nav = (KLNavigationController *)self.navigationController;
        [nav updateNavigationBarForViewController:self];
    }
}

-(void)kl_setNeedsUpdateNavigationBarAlpha {
    if (self.navigationController && [self.navigationController isKindOfClass:[KLNavigationController class]]) {
        KLNavigationController *nav = (KLNavigationController *)self.navigationController;
        [nav updateNavigationBarAlphaForViewController:self];
    }
}

- (void)kl_setNeedsUpdateNavigationBarColorOrImage {
    if (self.navigationController && [self.navigationController isKindOfClass:[KLNavigationController class]]) {
        KLNavigationController *nav = (KLNavigationController *)self.navigationController;
        [nav updateNavigationBarColorOrImageForViewController:self];
    }
}

- (void)kl_setNeedsUpdateNavigationBarShadowAlpha {
    if (self.navigationController && [self.navigationController isKindOfClass:[KLNavigationController class]]) {
        KLNavigationController *nav = (KLNavigationController *)self.navigationController;
        [nav updateNavigationBarShadowImageIAlphaForViewController:self];
    }
}

@end
