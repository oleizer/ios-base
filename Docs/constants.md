Constants
==

### Правила оформления констант:

### Локальная статическая константа

```objc
//.m file (файл реализации).
static const NSInterval kAnimationDuration = 3.0
```

### Статическая константа доступная из вне.

```objc
//.h file (файл заголовочный)
extern NSString *const EOCStringConstant;

//.m file (файл реализации)
NSString* const EOCStringConstant = @"VALUE";
```









