Constants(Константы). Enums (Перечисления).
==

## Правильное использование констант

### Локальная статическая константа для обертки скалярной величины.

```objc
//.m file (файл реализации).
static const NSInterval kAnimationDuration = 3.0
```

### Локальная статическая константа для объекта.
```objc
//Constants
static NSString *const kFineCell = @"SHGFineCell";
```

### Статическая константа доступная из вне. например константы для NSNotificationCenter.

```objc
//.h file (файл заголовочный)
extern NSString *const EOCStringConstant;

//.m file (файл реализации)
NSString* const EOCStringConstant = @"VALUE";
```

```objc
//EOCAnimatedView.h
extern const NSTimerInterval EOCAnimatedViewAnimationDuration;

//EOCAnimatedView.m
const NSTimerInterval EOCAnimatedViewAnimationDuration = 0.3;
```
