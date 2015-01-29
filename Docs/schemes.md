
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




















[iOS Quick Tip: Managing Configurations With Ease](http://code.tutsplus.com/tutorials/ios-quick-tip-managing-configurations-with-ease-mobile-18324)










