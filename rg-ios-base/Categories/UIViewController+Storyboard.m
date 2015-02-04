//
//  UIViewController+Storyboard.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (id)loadFromStoryboard:(NSString *)className
{
    //Storyboard class_name and storyboard_id - must be equal.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:className];
    
    return controller;
}

@end
