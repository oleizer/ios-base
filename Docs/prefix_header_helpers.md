6. Prefix Header. Set .pch file and helpers.
==

## Зачем нужен?

Prefix header file - содержимое файла считывается препроцессором и ускоряется компилятором во всем скоупе программы.

## Установка Project-Prefix.pch.

1. Make new file: `⌘cmd+N`
2. iOS/Mac > Other > PCH File > `Project-Prefix.pch`.
3. Project > Build Settings > Search: "Prefix Header".
4. Under "Apple LLVM 6.0" you will get the Prefix Header key.
5. Type in: "$(PROJECT_NAME)/$(PRODUCT_NAME)-Prefix.pch".
6. Clean project: `⌘cmd+⇧shift+K`
7. Build project: `⌘cmd+B`

![Prefix Header](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/prefix_header.png)

## Константы и хелперы в Project-Prefix.pch

Helpers in .pch file.
```objc
#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//#define MR_SHORTHAND
#import <CoreData+MagicalRecord.h>
#endif

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
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil
```

### Combinations of iOS systems

```objc
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
```

