
## 21. Controller hierarchy. RootController. RootNavigationController. RootTabBarController. Autorotation. StatusBar.

###Status bar (RootController)

**1 способ**
Этот метод можно определить в `RootController` классе-контроллере и потом наследовать от него другие классы-контроллеры.
```objc
//In Project-Info.plist set to UIViewControllerBasedStatusBarAppearance = YES.
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
```
###Status bar (Project Plist)
**2 способ**
Status bar можно кастомизировать, без кода.

В **project plist** помещаем:
Status bar style: `UIStatusBarStyleLightContent`
View controller-based status bar appearance: `NO`
Status bar is initially hidden: `NO`

###Root Navigation Controller


###Root TabBar Controller


###Autorotation










