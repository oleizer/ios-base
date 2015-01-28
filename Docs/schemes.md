
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

1. Edit Info.plist

Step 1: Add Custom Configurations


[Managing Configurations with Ease](http://code.tutsplus.com/tutorials/ios-quick-tip-managing-configurations-with-ease-mobile-18324)










