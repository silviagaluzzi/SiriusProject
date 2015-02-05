//
//  SiriusTabBarControllerViewController.m
//  Sirius
//
//  Created by Silvia Galuzzi on 03/02/15.
//  Copyright (c) 2015 Silvia Galuzzi. All rights reserved.
//

#import <Parse/Parse.h>
#import "SiriusTabBarControllerViewController.h"
#import "SiriusUser.h"
#import "SiriusLogInViewController.h"
#import "SiriusSignUpViewController.h"
#import "Notifications.h"
#import "MainController.h"


@interface SiriusTabBarControllerViewController ()

@end

@implementation SiriusTabBarControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
/*    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(showLogin:)
                                                     name:NOTIFICATIONS_AUTH_SHOWLOGIN
                                                   object:nil];
    }
*/ 
    return self;

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![SiriusUser currentUser]) {
        [self showLogin:self];
    } else {
        [[MainController sharedController] refreshCurrentUserData];
    }
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) showLogin:(id)sender
{
    SiriusSignUpViewController	*signUpViewController	= [[SiriusSignUpViewController alloc] init];
    SiriusLogInViewController	*loginViewController = [[SiriusLogInViewController alloc] init];
    
    signUpViewController.fields	= PFSignUpFieldsDefault;
    signUpViewController.delegate = self;
    
    loginViewController.delegate = self;
    
    loginViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton | PFLogInFieldsPasswordForgotten | PFLogInFieldsFacebook;
    loginViewController.facebookPermissions = @[ @"user_about_me" ];
    loginViewController.signUpController	= signUpViewController;
    
    loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    loginViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:loginViewController animated:YES completion:nil];
    
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0,
                              0.0,
                              self.view.frame.size.width / [self.viewControllers count],
                              self.tabBar.frame.size.height
                              );
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    
    [button setContentMode:UIViewContentModeCenter];
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = self.tabBar.center;
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [button addTarget:self action:@selector(newPhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)newPhoto:(UIButton*)sender {
    
      
}


@end
