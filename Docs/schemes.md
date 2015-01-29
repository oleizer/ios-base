
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

[Two Custom Configurations](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/two_custom_configurations.png)

###Step 2: Edit Info.plist

Adding a New Entry to Info.plist

Key - `Configuration` and value - `${CONFIGURATION}`

The `CONFIGURATION` identifier identifies the build configuration (Staging or Production)

###Step 3: Fetch Current Configuration




[Add a new entry to Info.plist]()








[iOS Quick Tip: Managing Configurations With Ease](http://code.tutsplus.com/tutorials/ios-quick-tip-managing-configurations-with-ease-mobile-18324)










