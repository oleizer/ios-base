Root Navigation Controller
==

```objc
@import UIKit;

typedef enum {
    NavigationBarStyleClear = 0,
    NavigationBarStyleBlue,
    NavigationBarStyleWhiteTransparent,
    NavigationBarStyleBlackTransparent,
    NavigationBarStyleLightGray,
    NavigationBarStyleDarkGray
    
} NavigationBarStyle;

typedef enum {
    BarButtonStyleWhite = 0,
    BarButtonStyleGray,
    BarButtonStyleLightGray
    
} BarButtonStyle;

@interface RootNavigationController : UINavigationController

+ (RootNavigationController *)sharedController;

- (void)setNavigationBarStyle:(NavigationBarStyle)style;
- (void)setBackBarButtonStyle:(BarButtonStyle)style;

@end
```

```objc
#import "RootNavigationController.h"

//Categories
#import "UIImage+Workers.h"

//Controllers
#import "KZMMuzeumController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

static RootNavigationController *_sharedController;
+ (RootNavigationController *)sharedController {
    return _sharedController;
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Привязка экземпляра RootNavigationController
    _sharedController = self;
//    [self configureNavigationBar];
}

#pragma mark - Configures

- (void)configureNavigationBar
{
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    self.navigationBar.translucent = YES;
}

#pragma mark - NavigationBarStyle

- (void)setNavigationBarStyle:(NavigationBarStyle)style
{
    switch (style) {

        case NavigationBarStyleClear: {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
            self.navigationBar.translucent = YES;
        }
            break;

        default:
            break;
    }
}

#pragma mark - BackBarButtonStyle

- (void)setBackBarButtonStyle:(BarButtonStyle)style
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    
    if ([topController isKindOfClass:[KZMMuzeumController class]]) {
        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-50"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
        
        topController.navigationItem.leftBarButtonItem = barButtonItem;
        
        switch (style) {
            case BarButtonStyleWhite: {
                topController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
            }
            break;
            
            case BarButtonStyleGray: {
                topController.navigationItem.leftBarButtonItem.tintColor = [UIColor lightGrayColor];
            }
            break;
            
            case BarButtonStyleLightGray: {
                topController.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithWhite:89.0f/255.0f alpha:0.5];
            }
            break;
                
            default:
                break;
        }
    }
}

#pragma mark - Events

- (void)backButtonClicked:(id)sender
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    [topController.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Status Bar

//In Project-Info.plist set to UIViewControllerBasedStatusBarAppearance = YES.
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

```








