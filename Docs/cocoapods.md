## 3. CocoaPods for using third party libraries.

`CocoaPods` библиотека управления зависимостями для OS X и iOS проектов.

`Недостатки`, которые решает CocoaPods:
* Следить за версиями библиотек и связями между собой.
* Общее места, где можно посмотреть все доступные библиотеки.
* Возможность обновлять исходный код библиотек. (отчасти решается спомощью `git submodules`).
* Возможность добавлять свой локальный код в библиотеку и обновлять до новой версии.



`CocoaPods` is a library dependency management tool for OS X and iOS applications.
With CocoaPods, you can define your dependencies, called pods, and manage their versions easily over time and across development environments.

Check that CocoaPods installed. You see `/usr/bin/pod` or `pod not found`.
* ```$ which pod```

CocoaPods runs on Ruby, update RubyGems. 
* ```$ sudo gem update --system```

Install CocoaPods with RubyGems. 

* ```$ sudo gem install cocoapods```

Clones the CocoaPods Specs repository into ~/.cocoapods/ on your computer. 

* ```$ pod setup```

This will create a default Podfile for your project.

* ```$ pod init```

Create Podfile for your project.

* ```$ vim Podfile```

Что бы закончить редактирование, нужно нажать <Esc> и ввести команду ```:wq``` (сохранить и выйти).

Add libs to Podfile:
```
platform:ios, '6.1'
pod 'SVProgressHUD', '~>0.8'
pod 'AFNetworking', '~>2.4'
pod 'MagicalRecord', '~>2.2'
```

Install dependencies to your project.
* ```$ pod install```
