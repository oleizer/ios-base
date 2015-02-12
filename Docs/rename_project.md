
## 12. Rename project in Xcode6.

1. Зайти чере .xproj (избегаем проблем с pods libraries) и переименовать проект.

2. потом зайти в Host у target-a и поменять.

3. pod update. создается новый .xcworkspace

4. заходим через новый .xcworkspace и можно удалить старый rg-ios-base.xcworkspace

5. поменять  `главную папку` - на название проекта, после поменять пути к prefixheader.pch и info.plist









