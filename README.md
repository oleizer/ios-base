# rg-ios-base
iOS Base - project with pre-settings, well-organised and best-practices for quickly starting the new project.

**Issues:**

## 1. Structure code by groups. (Groups structure in Project Navigator).

Организация кода по группам в Project Navigator-е и в директориях проекта.

![Groups structure in Project Navigator] (https://github.com/arthurigberdin/rg-ios-base/blob/readme/Docs/project-navigator-structure.png)

* **App** имеет 8 подгрупп:
    * __Storyboards__: только storyboard файлы.
    * __Models__: все модельки включая классы Core Data и `xcdatamodeld` файл модели бд.
    * __Views__: все кастомные view, в том числе кастомны table view cells.
    * __Controllers__: все контроллеры.
    * __Managers__:  другие классы как контроллеры, но не view сontrollers, напрмиер класс http-клиент который управляет запросами к API.
    * __Categories__: все категории.
    * __Resources__: файлы ресурсы: картинки, шрифты, документы и тд.
    * __Supporting Files__: группа для шаблонных XCode файлов. (plist, main, pch).


## 2. Structure code inside project with pragma marks.

## 3. CocoaPods for using third party libraries.
CocoaPods is a library dependency management tool for OS X and iOS applications.
With CocoaPods, you can define your dependencies, called pods, and manage their versions easily over time and across development environments.

CocoaPods runs on Ruby, update RubyGems.

```$sudo gem update --system```

Install CocoaPods with RubyGems.

```$sudo gem install cocoapods```

Clones the CocoaPods Specs repository into ~/.cocoapods/ on your computer.

```$pod setup```

This will create a default Podfile for your project. 

```$pod init```

Create Podfile for your project
Что бы закончить редактирование, нужно нажать <Esc> и ввести команду :wq (сохранить и выйти)

```vim Podfile```

Add libs

```
platform:ios, '6.1'
pod 'SVProgressHUD', '~>0.8'
pod 'AFNetworking', '~>2.4'
pod 'MagicalRecord', '~>2.2'
```

Install dependencies to your project

```$pod install```

## 4. Podfile with recommended libs.

```
platform:ios, '6.1'
pod 'SVProgressHUD', '~>0.8'
pod 'AFNetworking', '~>2.4'
pod 'MagicalRecord', '~>2.2'
```

## 5. Worker Categories.

## 6. Set .pch file. Helpers in .pch file.

1. Make new file: ⌘cmd+N
2. iOS/Mac > Other > PCH File > YourProject-Prefix.pch.
3. Project > Build Settings > Search: "Prefix Header".
4. Under "Apple LLVM 6.0" you will get the Prefix Header key.
5. Type in: "YourProjectName/YourProject-Prefix.pch".
6. Clean project: ⌘cmd+⇧shift+K
7. Build project: ⌘cmd+B

![Prefix Header](https://github.com/arthurigberdin/rg-ios-base/blob/readme/Docs/prefix_header.png)

Helpers in .pch file.
```
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//#define MR_SHORTHAND
 #import <CoreData+MagicalRecord.h>

#define BUNDLE_ID [NSBundle mainBundle].bundleIdentifier

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define IS_IOS_7  ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0f)
#define IS_IOS_8  ([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0f)

#define IS_IPAD      ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
#define IS_IPHONE    ([UIDevice currentDevice].userInterfaceIdiom != UIUserInterfaceIdiomPad)
#define IS_LANDSCAPE UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)

#define IS_RETINA ([UIScreen mainScreen].scale==2.0)
#define ONE_PIXEL (([UIScreen mainScreen].scale==2.0)?0.5f:1.0f)

#define RGB(r, g, b)     [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil
```

## 7. .gitignore file.
## 8. Debug Logging. DLog.
## 9. Images.xcassets.
## 10. Treat “Warnings” as errors. (How hide warnings in XCode).
## 11. Schemes: staging vs production (icons, app_ids, bundles).
## 12. Documented code.
## 13. Crittercism (crash reports).
## 14. Magical Record + MOGenerator.
## 15. Scripts. (Automatically push build to TestFlight).
## 16. Unit tests.
## 17. Automation tests.
## 18. TravisCI, Continuous Integration.
## 19. CodeStyle.
## 20. Store secrets and tokens.
## 21. Controller hierarchy. (Rules of design on paper).
