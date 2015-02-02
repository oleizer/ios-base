//
//  VKUser.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "VKUser.h"

@implementation VKUser


- (id)initWithServerResponse:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        self.first_name = [dict objectForKey:@"first_name"];
        self.last_name = [dict objectForKey:@"last_name"];
        
        NSString *urlString = [dict objectForKey:@"photo_50"];
        if (urlString) {
            self.photo_50 = [NSURL URLWithString:urlString];
        }
        
        self.uid = [dict objectForKey:@"uid"];
    }
    
    return self;
}

@end
