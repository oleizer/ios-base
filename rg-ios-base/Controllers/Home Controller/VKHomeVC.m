//
//  VKHomeVC.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "VKHomeVC.h"
#import "VKLoginVC.h"

@interface VKHomeVC ()

@end

@implementation VKHomeVC

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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    
    VKLoginVC *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"VKLoginVC"];
    
    
    [self.navigationController pushViewController:loginVC animated:YES];
}


@end
