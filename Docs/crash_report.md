
## 13. Crittercism (crash reports).

Регистрируемся на `Crittercism.com`, регистрируем приложение.

Загружаем через Podfile:
```objc
pod 'CrittercismSDK', '~>5.0.7'
```

В delegate's emplementation файл импортируем Crittercism.
```objc
#import "Crittercism.h"
```

Включаем Crittercism
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  //CRITTERCISM
  [Crittercism enableWithAppID:@"54cd2a913cf56b9e0457dad1"];
}
```
