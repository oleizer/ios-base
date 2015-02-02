//
//  VKUser.h
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKUser : NSObject

//JSON:
//{
//    response =     (
//                    {
//                        "first_name" = Anton;
//                        "last_name" = Tatarsky;
//                        "photo_50" = "http://cs322827.vk.me/v322827261/5881/_1g48-plY54.jpg";
//                        uid = 223761261;
//                    }
//                   );
//}

@property (strong, nonatomic) NSString *first_name; //firstName
@property (strong, nonatomic) NSString *last_name;  //lastName
@property (strong, nonatomic) NSURL *photo_50;      //photo50
@property (strong, nonatomic) NSString *uid;        //uId

- (id)initWithServerResponse:(NSDictionary *)responseObject;

@end
