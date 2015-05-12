1. Ignoring files. gitignore.
==

Git использует специальный файл `.gitignore`, который хранит информацию о файлах которые вы не желаете коммитить в `Git репозиторий`. Эти файлы игнорятся когда выполняется Git коммит.

Для создания файла используем команду - 
`$ touch .gitignore`

Содержания файла .gitignore для Xcode:
* settting file `.DS_Store`
* private scheme file `.xcuserdatad`
* some temporary files by vim `.swp files`
* some secret files `tokens, secrets`
* pod files `.pods`
* user data in xcworkspace
`project.xcworkspace/`
`xcuserdata/`

```
# Xcode
#
build/
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata
*.xccheckout
*.moved-aside
DerivedData
*.hmap
*.ipa
*.xcuserstate

# OS X temporary files
#
.DS_Store
.Trashes
.swp

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# http://guides.cocoapods.org/using/using-cocoapods.html#should-i-ignore-the-pods-directory-in-source-control
#
# Pods/
```

Чтобы `файл игнорился` 
* Проверить что файл игнорится, можно командой `$ git status`
* Нужно чтобы он `был удален с удаленного репозитория`.
* Допустим чтобы игнорился UserInterfaceState.xcuserstate внутри xcodeproj залитого на GitHub, нужно зайти в GitHub и удалить этот файл.

С помощью `.gitignore` можно осуществить игнор файлов` в новый проект.




