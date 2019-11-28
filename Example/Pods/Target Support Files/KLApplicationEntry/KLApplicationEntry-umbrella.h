#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "KLNavigationController+Init.h"
#import "UITabBarController+Init.h"

FOUNDATION_EXPORT double KLApplicationEntryVersionNumber;
FOUNDATION_EXPORT const unsigned char KLApplicationEntryVersionString[];

