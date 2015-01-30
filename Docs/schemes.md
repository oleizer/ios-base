
## 11. Build Schemes and Configurations

### Schemes

* Debug, Development(Staging), Production, Unit Tests, Integration Tests
* D- and P- TestFlight builds

### Configurations

* Xcode Configurations
* $(CONFIGURATION)
* Plist
* -[AppConfiguration currentConfiguration]
 
Xcode schemes and custom project configurations:

The Problem:

Перед обновлением приложение нужно протестировать на Staging и Production сервере (среде). Нужно автоматизировать переключение конфигураций (configurations).

The Solution:

Создать пользовательскую (кастомную) конфигурацию для каждой среды. Это включает в себя создание файла конфигурации, кот. централизует переменные окружения и пользовательскую (кастомную) схему Xcode.

###Step 1: Add Custom Configurations

Where defined `Configurations`:

ProjectNavigator > Project > Info > Configurations

Чтобы создать новую конфигурацию > выделите `Debug` > нажмите  `+` (Dublicate "Debug" Configuration) > Переименовать (`Staging` и `Production`).

Two Custom Configurations

![Two Custom Configurations](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/two_custom_configurations.png)

###Step 2: Edit Info.plist

Adding a New Entry to Info.plist

Key - `Configuration` and value - `${CONFIGURATION}`

The `CONFIGURATION` identifier identifies the build configuration (Staging or Production)

![Add a new entry to Info.plist](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/new_entry_info_plist.png)

###Step 3: Fetch Current Configuration
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
- {
    //Fetch current configuration in app
    NSString *configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    
    DLog(@"Current Configuration > %@", configuration); //Выводит - Debug (Scheme: rg-ios-base, Run - Debug)

    return YES;
}
```

###Custom Xcode Schemes

Когда Xcode собирает билд (building) приложения, используется `Scheme` (Cхема). В Scheme определяются пременные, которые используются когда собирается билд. Одной из этих переменных является `configuration` которые должны быть использованы.

Используюемая Scheme отображается на левом верхнем toolbare-а.

Для простого переключения между конфигурациями (Staging, Production) рекомендуется использовать новую схему для каждой конфигурации.

Создаем кастомные схемы для `Staging` и `Production` конфигураций.

![Custom scheme](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/custom_scheme.png)


###Create a Configuration File

Create a custom `property list (.plist)` that groups the various configuration settings.

Property list is a dictionary with an entry for each configuratio. Each entry in the property list holds anoterh dictionary with information specific for that configuration

Create new property list and name it `Configuration.plist`:

![Configuration plist](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/configuration_plist.png)


###Configuration Class

Developer friendly realization with Configuration class.

Configuration class - fetch current configuratioon, loads Configuration.plist. 

```objc
#import <Foundation/Foundation.h>

@interface ConfigurationManager : NSObject //Singleton

#pragma mark -
+ (NSString *)configuration;
#pragma mark -
+ (NSString *)OauthUrl;
+ (NSString *)ApiUrl;
#pragma mark -
+ (BOOL)isLoggingEnabled;

@end
```

```objc
#import "ConfigurationManager.h"

#define ConfigurationOauthUrl        @"OauthUrl"
#define ConfigurationApiUrl          @"ApiUrl"
#define ConfigurationLoggingEnabled  @"LoggingEnabled"

@interface ConfigurationManager ()

@property (copy, nonatomic) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;

@end

@implementation ConfigurationManager

#pragma mark -
#pragma mark Shared Configuration
+ (ConfigurationManager *)sharedConfiguration {
    static ConfigurationManager *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

#pragma mark -
#pragma mark Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        // Fetch Current Configuration
        NSBundle *mainBundle = [NSBundle mainBundle];
        self.configuration = [[mainBundle infoDictionary] objectForKey:@"Configuration"];
        
        // Load Configurations
        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // Load Variables for Current Configuration
        self.variables = [configurations objectForKey:self.configuration];
    }
    
    return self;
}

#pragma mark - Configuration
+ (NSString *)configuration {
    return [[ConfigurationManager sharedConfiguration] configuration];
}

#pragma mark - Urls
+ (NSString *)OauthUrl {
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:ConfigurationOauthUrl];
    }
    
    return nil;
}

+(NSString *)ApiUrl
{
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:ConfigurationApiUrl];
    }
    
    return nil;
}

#pragma mark - Logging
+ (BOOL)isLoggingEnabled{
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [[sharedConfiguration.variables objectForKey:ConfigurationLoggingEnabled] boolValue];
    }
    
    return NO;
}
```

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    //Fetch current configuration in app
    NSString *configuration = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"Configuration"];
    
    //(Scheme: Production, Console > Production)
    DLog(@"Current Configuration > %@", configuration);
    
    NSLog(@"Oauth Endpoint > %@", [ConfigurationManager OauthUrl]);
    NSLog(@"API Endpoint > %@", [ConfigurationManager ApiUrl]);
    
    NSLog(@"Is Logging Enabled > %i", [ConfigurationManager isLoggingEnabled]);
    
    return YES;
}
```

Дополнить: вытаскивание bundleID, iconName etc.
https://github.com/2359media/ios-dev-guide

[iOS Quick Tip: Managing Configurations With Ease](http://code.tutsplus.com/tutorials/ios-quick-tip-managing-configurations-with-ease--mobile-18324)










