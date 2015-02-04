//
//  LoginController.h
//  rg-ios-base
//
//  Created by Artur on 02/02/15.
//  Copyright (c) 2015 Artur Igberdin. All rights reserved.
//

#import "LoginController.h"
#import "FriendsController.h"

@interface LoginController ()

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LoginController

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
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FriendsController" bundle:nil];
//    FriendsController *friendsVC = [storyboard instantiateViewControllerWithIdentifier:@"FriendsController"];
    
    FriendsController *friendsVC = [UIViewController loadFromStoryboard:NSStringFromClass([FriendsController class])];
    
    [self.navigationController pushViewController:friendsVC animated:YES];
}



#pragma mark  -

- (void) dealloc
{
    
}


@end
