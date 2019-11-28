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

#import "KLNavigationBar.h"
#import "KLNavigationController.h"
#import "KLNavigationHeader.h"
#import "UIViewController+KLNavigaitonController.h"

FOUNDATION_EXPORT double KLNavigationControllerVersionNumber;
FOUNDATION_EXPORT const unsigned char KLNavigationControllerVersionString[];

