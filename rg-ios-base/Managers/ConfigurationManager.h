//
//  ConfigurationManager.h
//  rg-ios-base
//
//  Created by Artur on 29/01/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConfigurationManager : NSObject //Singleton

#pragma mark -
+ (NSString *)configuration;

#pragma mark -
+ (NSString *)OauthUrl;
+ (NSString *)ApiUrl;

#pragma mark -
+ (BOOL)isLoggingEnabled;

#pragma mark -
//Crittercism
//Crashlitycs

#pragma mark -
//VKSecretId
//InstagramSecretId
//FacebookSecretId
//TwitterSecretId
//YoutubeSecretId

@end
