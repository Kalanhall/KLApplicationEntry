//
//  KLNavigationBar.h
//  KLNavigationBar
//
//  Created by Kalan on 2018/3/23.
//

#import <UIKit/UIKit.h>

@interface KLNavigationBar : UINavigationBar

@property (nonatomic, strong, readonly) UIImageView *shadowImageView;
@property (nonatomic, strong, readonly) UIVisualEffectView *fakeView;
@property (nonatomic, strong, readonly) UIImageView *backgroundImageView;

@end
