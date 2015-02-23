//
//  RootNavigationController.h
//  rg-ios-base
//
//  Created by Artur on 12/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NavigationBarStyleDarkGray = 0,
    NavigationBarStyleLightGray,
    NavigationBarStyleGray,
    
    NavigationBarStyleWhiteTransparent,
    NavigationBarStyleBlackTransparent,
    
    NavigationBarStyleClear,
} NavigationBarStyle;

@interface RootNavigationController : UINavigationController

+ (RootNavigationController *)sharedController;

/**
 Set custom navigation bar style
 @param style NavigationBarStyle type
 */
- (void)setNavigationBarStyle:(NavigationBarStyle)style;

/**
 Set custom navigation bar title
 @param title NSString type
 */
- (void)setNavigationBarTitle:(NSString *)title;

/**
 Set default leftBarButton with left arrow image
 */
- (void)setBackBarButton;


@end
