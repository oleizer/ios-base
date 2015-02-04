//
//  LoginController.h
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <UIKit/UIKit.h>

//тип данных для блока
//typedef void(^VKLoginCompletionBlock)(VKAccessToken *token);

@class VKAccessToken;

@interface LoginController : UIViewController

//Если делается framework, то лучше делать все в коде
- (id)initWithCompletionBlock:(void(^)(VKAccessToken *token))completion;

@end
