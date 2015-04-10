
## 5. UIViewController. Pass data between controllers.

###Pass data from Navigation Controller.

```objc
MyViewController * myVC = [[MyViewController alloc] initWithNibName:nil bundle:nil];
myVC.someProperty = someValue;    // Pass your data here
[self.navigationController pushViewController:myVC animated:YES];
And in your MyViewController class :

.h

@interface MyViewController : UIViewController
@property (nonatomic, strong) NSString * someProperty;
@end

.m

@implementation MyViewController

    - (void)viewDidLoad {
        [super viewDidLoad];
        // your data has been set
        // self.someProperty is equal to "some value"
    }
```



