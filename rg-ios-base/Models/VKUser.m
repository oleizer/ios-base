//
//  VKUser.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "VKUser.h"

@implementation VKUser


- (id)initWithServerResponse:(NSDictionary *)responseObject
{
    self = [super init];
    if (self) {
        
        self.first_name = [responseObject objectForKey:@"first_name"];
        self.last_name = [responseObject objectForKey:@"last_name"];
        
        NSString *urlString = [responseObject objectForKey:@"photo_50"];
        if (urlString) {
            self.photo_50 = [NSURL URLWithString:urlString];
        }
        
        self.uid = [responseObject objectForKey:@"uid"];
    }
    
    return self;
}

@end
