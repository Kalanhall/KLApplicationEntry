//
//  UIViewController+KLNavigationController.h
//  KLNavigationBar
//
//  Created by Kalan on 2018/3/23.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KLNavigationController)

@property (nonatomic, assign) IBInspectable BOOL kl_blackBarStyle;
@property (nonatomic, assign) UIBarStyle kl_barStyle;
@property (nonatomic, strong) IBInspectable UIColor *kl_barTintColor;
@property (nonatomic, strong) IBInspectable UIImage *kl_barImage;
@property (nonatomic, strong) IBInspectable UIColor *kl_tintColor;
@property (nonatomic, strong) NSDictionary *kl_titleTextAttributes;

@property (nonatomic, assign) IBInspectable float kl_barAlpha;
@property (nonatomic, assign) IBInspectable BOOL kl_barHidden;
@property (nonatomic, assign) IBInspectable BOOL kl_barShadowHidden;
@property (nonatomic, strong) IBInspectable UIColor * kl_barShadowColor;
@property (nonatomic, assign) IBInspectable BOOL kl_backInteractive;
@property (nonatomic, assign) IBInspectable BOOL kl_swipeBackEnabled;
@property (nonatomic, assign) IBInspectable BOOL kl_clickBackEnabled;

// computed
@property (nonatomic, assign, readonly) float kl_computedBarShadowAlpha;
@property (nonatomic, strong, readonly) UIColor *kl_computedBarTintColor;
@property (nonatomic, strong, readonly) UIImage *kl_computedBarImage;

- (void)kl_setNeedsUpdateNavigationBar;
- (void)kl_setNeedsUpdateNavigationBarAlpha;
- (void)kl_setNeedsUpdateNavigationBarColorOrImage;
- (void)kl_setNeedsUpdateNavigationBarShadowAlpha;

@end
