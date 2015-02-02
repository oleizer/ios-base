//
//  VKLoginVC.m
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "VKLoginVC.h"
#import "VKFriendsVC.h"

@interface VKLoginVC ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation VKLoginVC

#pragma mark - View lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}




#pragma mark - Actions

- (IBAction)actionFriends:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Friends" bundle:nil];
    
    VKFriendsVC *friendsVC = [storyboard instantiateViewControllerWithIdentifier:@"VKFriendsVC"];
    
    
    [self.navigationController pushViewController:friendsVC animated:YES];
}



#pragma mark  -

- (void) dealloc
{
    
}


@end
