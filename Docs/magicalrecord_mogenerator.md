
## 14. Magical Record + MOGenerator.

http://raptureinvenice.com/getting-started-with-mogenerator/

`MOGenerator` - генерирует ObjC код для кастомных классов(моделей) CoreData. 
Mogenerator генерирует два класса для Entity(cущности) - один для *machines* и второй для *humans*. Машинный класс будет overwritten (перезаписан) при запуске mogen скрипта.

Что делает MOGenerator:
1.Быстрое и легкая генерация конкретных классов для модели.
2.Представление в виде двух-классов.
3.Устраняет необходимость обертывать (wrap) числовые аттрубуты в объект NSNumber.
4.Удобные setter методы.
5.Удобные wrapper-методы для вставки и идентификации сущности.

До установки MOGen скрипта.
1. [Install MOGen from a DMG](http://rentzsch.github.io/mogenerator/) и Setup project.

Настраиваем проект:

Добавляем новый Таргет - `Aggregate` таргет > назовем его Mogenerator.

Mogenerator > Build Phase > "+" > `New Run Script Build Phase` > оставляем the Shell at `/bin/sh`

ObjC:
`mogenerator -m parking-ios/Models/Model.xcdatamodeld/Model.xcdatamodel -O parking-ios/Models/Model --template-var arc=true`

New file > Создаем новый файл Model.xcdatamodeld в директории Models 
> Создаем модели например: MMUser, MMSettings, MMParkingCapture

Когда модели созданы нужно настроить сущности модели `Populate class field` Class > MMUser.



