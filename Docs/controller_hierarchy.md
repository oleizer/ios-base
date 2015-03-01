
## 21. Controller hierarchy. RootController. RootNavigationController. RootTabBarController. Autorotations. StatusBar.

###Status bar (RootController)
Этот метод можно определить в `RootController` классе-контроллере и потом наследовать от него другие классы-контроллеры.
```objc
//Info.plist set to UIViewControllerBasedStatusBarAppearance = YES.
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
```










