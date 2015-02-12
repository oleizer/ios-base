
## 18. Rename project in Xcode6. Certificates

1. Зайти чере `.xproj` (избегаем проблем с pods libraries) и переименовать проект.

2. потом зайти в `Host` у target-a и поменять.

3. `pod update`. создается новый .xcworkspace

4. заходим через новый `.xcworkspace` и можно удалить старый rg-ios-base.xcworkspace

5. поменять  `главную папку` - на название проекта, после поменять пути к prefixheader.pch и info.plist

6. все проект создан, осталось удалить папки Docs, Images, переименовать Readme.md и переименовать BundleID.


**Лучшее решение было бы конечно это автоматизировть запуском скрипта, который проводит эти манипуляции с проектом.**

###Certificates

1. Certificates `Development and Distribution`.

2. Create `App ID` with bundle ID.

3. Create `Profile: Development, AddHoc and AppStore`.

4. Add to project target in tab `Build Settings` certificates and profiles.





