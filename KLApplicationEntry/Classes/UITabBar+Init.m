//
//  UITabBar+Init.m
//  KLApplicationEntry
//
//  Created by Logic on 2020/5/19.
//

#import "UITabBar+Init.h"
#import <objc/runtime.h>

@implementation UITabBar (Init)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oldm = class_getInstanceMethod(self, @selector(hitTest:withEvent:));
        Method newm = class_getInstanceMethod(self, @selector(kl_hitTest:withEvent:));
        
        BOOL isAdd = class_addMethod(self, @selector(hitTest:withEvent:), method_getImplementation(newm), method_getTypeEncoding(newm));
        
        if (isAdd) {
            class_replaceMethod(self, @selector(kl_hitTest:withEvent:), method_getImplementation(oldm), method_getTypeEncoding(oldm));
        } else {
            method_exchangeImplementations(oldm, newm);
        }
    });
}

// 响应链处理
- (UIView *)kl_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *subView in self.subviews) {
        CGPoint targetPoint = [self convertPoint:point toView:subView];
        UIView *view = [subView hitTest:targetPoint withEvent:event];
        if (view) {
            return view;
        }
    }
    return [self kl_hitTest:point withEvent:event];
}


@end
