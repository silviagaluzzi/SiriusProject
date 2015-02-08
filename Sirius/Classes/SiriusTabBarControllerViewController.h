//
//  SiriusTabBarControllerViewController.h
//  Sirius
//
//  Created by Silvia Galuzzi on 03/02/15.
//  Copyright (c) 2015 Silvia Galuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SiriusTabBarControllerViewController : UITabBarController<PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate>

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage;



@end
