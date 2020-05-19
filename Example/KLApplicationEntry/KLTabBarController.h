//
//  KLTabBarController.h
//  KLApplicationEntry_Example
//
//  Created by Logic on 2020/5/19.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLTabBarController : UITabBarController

@property (copy, nonatomic) void (^selectedCenterItemCallBack)(void);

@end

NS_ASSUME_NONNULL_END
