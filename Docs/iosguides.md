0. iOS Guides. Codestyle guides.
=== 

### Типизированные константы VS. препроцессорные директивы #define.

```objc
//Define constant - WRONG!!!
#define ANIMATION_DURATION 0.3
```

```objc
//Typed constant - CORRECT
#static const NSTimerInterval kAnimationDuration = 0.3;
```

## Префиксы. Соглашение.

```Префикс - k``` - для локальных констант (констант локальных по отношению к файлу реализации).

```Префикс - Имя класса``` - для глобальных констант (для констант доступных за пределами класса).








