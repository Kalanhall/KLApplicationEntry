## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
    // 配置导航栏
    [KLNavigationController navigationGlobalTincolor:UIColor.blackColor];
    [KLNavigationController navigationGlobalBarTincolor:UIColor.blackColor];
    [KLNavigationController navigationGlobalBackIndicatorImage:[UIImage imageNamed:@"back"]];
    [KLNavigationController navigationGlobalBarButtonItemTitleTextColor:UIColor.clearColor font:nil];
    
    // 配置选项卡
    NSArray *controllers =
    @[[KLNavigationController navigationWithRootViewController:KLViewController.new title:@"商城" image:@"Tab0" selectedImage:@"Tab0-h"],
      [KLNavigationController navigationWithRootViewController:KLViewController.new title:@"发现" image:@"Tab1" selectedImage:@"Tab1-h"],
      [KLNavigationController navigationWithRootViewController:KLViewController.new title:@"购物" image:@"Tab2" selectedImage:@"Tab2-h"],
      [KLNavigationController navigationWithRootViewController:KLViewController.new title:@"我的" image:@"Tab3" selectedImage:@"Tab3-h"]];
    self.window.rootViewController = [UITabBarController tabBarWithControllers:controllers];
    
    // *********    UITabBarController 有3个扩展方法  *********
    
    /// 设置选项卡文字及图片垂直方向位移
    - (instancetype)setItemPositionAdjustment:(UIOffset)offset;
    /// 设置选项卡阴影线颜色，默认0.5pt
    - (instancetype)setTabBarShadowColor:(nullable UIColor *)color;
    /// 设置选项卡背景颜色
    - (instancetype)setTabBarBackgroundColor:(nullable UIColor *)color;
    
```
