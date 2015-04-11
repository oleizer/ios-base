0. iOS Guides.
1. 

### Типизированные константы VS. препроцессорные директивы #define

```objc
//Define constant - WRONG!!!
#define ANIMATION_DURATION 0.3
```

```objc
//Typed constant - CORRECT
#static const NSTimerInterval kAnimationDuration = 0.3;
```






