//
//  VKHomeVC.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "HomeController.h"
#import "LoginController.h"

@interface HomeController ()

@end

@implementation HomeController

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions

- (IBAction)actionLoginWithVK:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginController" bundle:nil];
    
    LoginController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginController"];
    
    
    [self.navigationController pushViewController:loginVC animated:YES];
}


@end
