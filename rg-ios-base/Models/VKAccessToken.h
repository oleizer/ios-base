//
//  VKAccessToken.h
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKAccessToken : NSObject

/*
 URL: https://oauth.vk.com/blank.html#access_token=7094a207b4d92f9796fa7bbba96035a18371c360c91ae085d842bba7fe0569dd03bb0f3bf472565170e70&expires_in=86400&user_id=223761261
 */

@property (strong, nonatomic) NSString *access_token; //accessToken
@property (strong, nonatomic) NSDate *expiration_in;  //expirationIn
@property (strong, nonatomic) NSString *user_id;      //userId


@end
