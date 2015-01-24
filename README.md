# rg-ios-base
iOS Base - project with pre-settings, well-organised and best-practices for quickly starting the new project.

**Issues:**

## 1. Structure code by groups. (Groups structure in Project Navigator).

Организация кода по группам в Project Navigator-е и в директориях проекта.

![Groups structure in Project Navigator] (https://github.com/arthurigberdin/rg-ios-base/blob/readme/Docs/project-navigator-structure.png)

* 4 группы на верхнем уровне проекта **ios-base**: **MyApp**, **MyAppTests**, **Frameworks**, **Products**.
* Only 4 groups at the top level: **MyApp**, **MyAppTests**,**Frameworks** and **Products**. 
* `AppDelegate` на корневом уровне **MyApp**.
* **MyApp** имеет 8 подгрупп:
    * __Storyboards__: только storyboard файлы.
    * __Models__: все модельки включая классы Core Data и `xcdatamodeld` файл модели бд.
    * __Views__: все кастомные view, в том числе кастомны table view cells.
    * __Controllers__: все контроллеры.
    * __Managers__:  другие классы как контроллеры, но не view сontrollers, напрмиер класс http-клиент который управляет запросами к API.
    * __Categories__: все категории.
    * __Resources__: файлы ресурсы: картинки, шрифты, 
    * __Supporting Files__: группа для шаблонных XCode файлов.


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

## 5. Worker Categories.

## 6. Helpers in .pch file.

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
