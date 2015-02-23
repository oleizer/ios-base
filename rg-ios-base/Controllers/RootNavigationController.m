//
//  RootNavigationController.m
//  rg-ios-base
//
//  Created by Artur on 12/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

static RootNavigationController *_sharedController;
+ (RootNavigationController *)sharedController
{
    return _sharedController;
}

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sharedController = self;
}

#pragma mark - NavigationBarStyle

- (void)setNavigationBarStyle:(NavigationBarStyle)style
{
    switch (style) {
        case NavigationBarStyleGray:
        {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor backgroundColor]] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:nil];
            self.navigationBar.translucent = NO;
        }
            break;
            
        case NavigationBarStyleDarkGray:
        {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor grayColor]] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:nil];
            self.navigationBar.translucent = NO;
        }
            break;
            
        case NavigationBarStyleLightGray:
        {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:nil];
            self.navigationBar.translucent = NO;
        }
            break;
            
        case NavigationBarStyleClear:
        {
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
            self.navigationBar.translucent = YES;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Rotation Manager

- (BOOL)shouldAutorotate
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    return [topController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    return [topController supportedInterfaceOrientations];
}

#pragma mark - Navigation Bar Title

- (void)setNavigationBarTitle:(NSString *)title
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    
    CGRect frame = CGRectMake(0, 0, 200, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica Neue" size:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = title;
    
    topController.navigationItem.titleView = label;
}

#pragma mark - Back Bar Button

- (void)setBackBarButton
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    
    DLog(@"\n\n%@", NSStringFromClass(topController.class) );
    
//    if ([topController isKindOfClass:[AHFightersListController class]] ||
//        [topController isKindOfClass:[AHVideosController class]] ||
//        [topController isKindOfClass:[AHFighterProfileController class]] ||
//        [topController isKindOfClass:[AHSearchFighterController class]] ||
//        [topController isKindOfClass:[AHSettingsController class]])
//    {
//        UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left-arrow-btn"] style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonClicked:)];
//        
//        topController.navigationItem.leftBarButtonItem = barButtonItem;
//    }
}

- (void)backButtonClicked:(id)sender
{
    UIViewController *topController = (UIViewController *)self.topViewController;
    [topController.navigationController popViewControllerAnimated:YES];
}


@end
