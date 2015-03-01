
## 21. Controller hierarchy. (Rules of design on paper).

###Status bar
Этот метод можно определить в BaseController классе и потом наследовать от него.
```objc
//Info.plist set to UIViewControllerBasedStatusBarAppearance = YES.
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
```










