14. Magical Record + MOGenerator.
==
http://raptureinvenice.com/getting-started-with-mogenerator/

## Описание.

`MOGenerator` - генерирует `objc` код для кастомных классов-моделей CoreData. 
Mogenerator генерирует два класса `еntity-cущности` - один для **machines** и второй для **humans**. 
Машинный класс будет `перезаписываться` при запуске mogen скрипта.

Что делает MOGenerator:

1. Быстрое и легкая генерация конкретных классов для модели.
2. Представление в виде двух-классов.
3. Устраняет необходимость обертывать числовые аттрибуты в объект NSNumber.
4. Удобные setter-методы.
5. Удобные wrapper-методы для вставки и идентификации сущности.

## Установка MOGen cкрипта (mogenerator installer).
Скачивается mogenerator.dmg и производим установку приложения.

1. [Install MOGen from a DMG](http://rentzsch.github.io/mogenerator/) и Setup project.

## Настройка проекта:

### Таргет
Добавляем новый Таргет - `Aggregate` таргет > назовем его `Mogenerator`.

### Скрипт
Mogenerator > Build Phase > "+" > `New Run Script Build Phase` > оставляем поле Shell: `/bin/sh`

ObjC:
`mogenerator -m parking-ios/Models/Model.xcdatamodeld/Model.xcdatamodel -O parking-ios/Models/Model --template-var arc=true`

### Модель и настройка сущностей
New file > Создаем новый файл `Model.xcdatamodeld` в директории Models > Создаем модели например: MMUser, MMSettings, MMParkingCapture.

Когда модели созданы нужно настроить сущности модели `Populate class field` Class > MMUser.

![Equal Name and Class](https://github.com/arthurigberdin/rg-ios-base/blob/master/Images/Entity.png)

Добавляем MOGenerator (должен быть добавлен `CoreData.framework`), либо должна быть добавлена в Podfile проекта.

### Ручной запуск скрипта

Запуск скрипта "Mogenerator" для обновления генерируемых файлов:

Change your build target to "Mogenerator" (or whatever you called it) and `hit ⌘B` to build. And you’re done.

### Как работает и пример использования

You’ll notice that there are two sets of files, _Event.* and Event.*. If you’re not familiar with this pattern, it’s amazing. It’s also been used for years and shame on Apple that they don’t do this out of the box. The _Event.* files are generated and you should never touch them. The Event.* files are generated only if they don’t exist and you can feel free to add any methods and properties you like.

`Better Setters`

```objc
if (user.isAdmin) {
    ...
}
```
WRONG! The isAdmin attribute is an NSNumber, so this will evaluate to true for all cases where isAdmin isn’t nil! I ran into this so many times I even contemplated scrapping Core Data to erase the emotional pain.

Not anymore with Mogen. You can now write the code as:

```objc
if (user.isAdminValue) {
    ...
}
```

## Magical Record

Setup Magical Record in project.
```obj-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //MAGICAL RECORD
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"Model.xcdatamodeld"];
return YES;
}
- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}
```

Magical Record `Create and Update` entity.
```objc
[MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) 
{
        MMSettings *settings = [MMSettings MR_findFirst];
        if (settings == nil) {
            settings = [MMSettings MR_createEntityInContext:localContext];
        }
        settings.notifyIsEnabled = [NSNumber numberWithBool:_notificationSwitch.on];
        settings.notifySetTimer = _notificationTimerTextField.text;
        settings.userEmail = _notificationEmailTextField.text;
        
    } completion:^(BOOL contextDidSave, NSError *error) {
        MMSettings *settings = [MMSettings MR_findFirst];
        DLog(@"\n\nsettings = %@ %@ %@", settings.notifyIsEnabled, settings.notifySetTimer, settings.userEmail);
}];
```

Добавление новой Entity.
```objc
    MMSettings *settings = [MMSettings MR_findFirst];
    if (settings == nil) {
        settings = [MMSettings MR_createEntity];
    }
    settings.notifyIsEnabledValue = _notificationSwitch.on;
    settings.notifySetTimer = _notificationTimerTextField.text;
    settings.userEmail = _notificationEmailTextField.text;
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
```

Подтягиваем инфу от Entity для Presentation Layer.
```objc
    MMSettings *settings = [MMSettings MR_findFirst];
    self.notificationSwitch.on = settings.notifyIsEnabledValue;
    self.notificationTimerTextField.text = settings.notifySetTimer;
    self.notificationEmailTextField.text = settings.userEmail;
```
