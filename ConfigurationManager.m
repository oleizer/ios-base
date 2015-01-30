//
//  ConfigurationManager.m
//  rg-ios-base
//
//  Created by Artur on 29/01/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "ConfigurationManager.h"

#define ConfigurationOauthUrl        @"OauthUrl"
#define ConfigurationApiUrl          @"ApiUrl"
#define ConfigurationLoggingEnabled  @"LoggingEnabled"

@interface ConfigurationManager ()

@property (copy, nonatomic) NSString *configuration;
@property (nonatomic, strong) NSDictionary *variables;

@end

@implementation ConfigurationManager

#pragma mark -
#pragma mark Shared Configuration
+ (ConfigurationManager *)sharedConfiguration {
    static ConfigurationManager *_sharedConfiguration = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedConfiguration = [[self alloc] init];
    });
    
    return _sharedConfiguration;
}

#pragma mark -
#pragma mark Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        // Fetch Current Configuration
        NSBundle *mainBundle = [NSBundle mainBundle];
        self.configuration = [[mainBundle infoDictionary] objectForKey:@"Configuration"];
        
        // Load Configurations
        NSString *path = [mainBundle pathForResource:@"Configurations" ofType:@"plist"];
        NSDictionary *configurations = [NSDictionary dictionaryWithContentsOfFile:path];
        
        // Load Variables for Current Configuration
        self.variables = [configurations objectForKey:self.configuration];
    }
    
    return self;
}

#pragma mark - Configuration
+ (NSString *)configuration {
    return [[ConfigurationManager sharedConfiguration] configuration];
}

#pragma mark - Urls
+ (NSString *)OauthUrl {
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:ConfigurationOauthUrl];
    }
    
    return nil;
}

+(NSString *)ApiUrl
{
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [sharedConfiguration.variables objectForKey:ConfigurationApiUrl];
    }
    
    return nil;
}

#pragma mark - Logging
+ (BOOL)isLoggingEnabled{
    ConfigurationManager *sharedConfiguration = [ConfigurationManager sharedConfiguration];
    
    if (sharedConfiguration.variables) {
        return [[sharedConfiguration.variables objectForKey:ConfigurationLoggingEnabled] boolValue];
    }
    
    return NO;
}



@end
