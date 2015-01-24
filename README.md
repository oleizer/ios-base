# rg-ios-base
iOS Base - project with pre-settings, well-organised and best-practices for quickly starting the new project.

**Issues:**

## 1. Structure code by groups. (Groups structure in Project Navigator).

Организация кода по группам в Project Navigator-е и в директориях проекта.

![Groups structure in Project Navigator] (https://github.com/arthurigberdin/rg-ios-base/blob/readme/Docs/project-navigator-structure.png)

* 4 группы на верхнем уровне проекта **ios-base**: **MyApp**, **MyAppTests**, **Frameworks**, **Products**.

* Only 4 groups at the top level: **MyApp**, **MyAppTests**,
  **Frameworks** and **Products**. 
* `AppDelegate` на корневом уровне **MyApp**.
* **MyApp** имеет 8 подгрупп:
    * __Storyboards__: только storyboard файлы.
    * __Models__: все модельки включая классы Core Data и `xcdatamodeld` файл модели бд.


## 2. Structure code inside project with pragma marks.

## 3. CocoaPods for using third party libraries.

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
