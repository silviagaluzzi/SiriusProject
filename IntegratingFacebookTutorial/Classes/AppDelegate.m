/**
 * Copyright (c) 2014, Parse, LLC. All rights reserved.
 *
 * You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
 * copy, modify, and distribute this software in source code or binary form for use
 * in connection with the web services and APIs provided by Parse.

 * As with any software that integrates with the Parse platform, your use of
 * this software is subject to the Parse Terms of Service
 * [https://www.parse.com/about/terms]. This copyright notice shall be
 * included in all copies or substantial portions of the software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#import "AppDelegate.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

#import "LoginViewController.h"
#import "Utility.h"
#import "SiriusUser.h"
#import "SiriusActivity.h"
#import "SiriusPet.h"
#import "SiriusPhoto.h"
#import "SiriusTabBarControllerViewController.h"
#import "SiriusFeedViewController.h"
#import "SiriusProfileViewController.h"
#import "SiriusActivityViewController.h"
#import "SiriusCameraViewController.h"

#if APPSTORE
#define GATRACKINGID @"UA-?"
#define PARSE_APPID @"???"
#define PARSE_CLIENTKEY @"???"
#else
#define GATRACKINGID @"UA-?"
#define PARSE_APPID @"6j4TVHMyxhn0wnaBgZBQ5zIoUJxgsNXQ36SZwnCV"
#define PARSE_CLIENTKEY @"nLoMY6qrLWQGfWEz2RvWdUijPkdSBAxc34dtL1JF"
#endif




@implementation AppDelegate

#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    [Parse setApplicationId:PARSE_APPID clientKey:PARSE_CLIENTKEY];
    [[PFInstallation currentInstallation] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"Installation saved succesfully");
        } else {
            NSLog(@"Sorry something went wrong saving installation");
        }
    }];

    // ****************************************************************************
    // Your Facebook application id is configured in Info.plist.
    // ****************************************************************************
    [PFFacebookUtils initializeFacebook];

    [self userInterfaceSetup];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)userInterfaceSetup {
    
    //TODO: Google Analytics
    /*        id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:GATRACKINGID];
     #if DEBUG
     NSLog(@"Google Analytics ID: %@", GATRACKINGID);
     [[GAI sharedInstance] setDispatchInterval:1];
     #endif
     */
    
    
    //TODO: FB
    /*        [FBSettings setDefaultAppID:FACEBOOKAPPID];
     [FBAppEvents activateApp];
     */
    
    self.tabController = [[SiriusTabBarControllerViewController alloc] init];
    self.window.rootViewController = self.tabController;
    
    //Feed
    SiriusFeedViewController* home = [[SiriusFeedViewController alloc] initWithNibName:@"SiriusFeedViewController" bundle:nil];
    UINavigationController* navFeed = [[UINavigationController alloc] initWithRootViewController:home];
    
    //Profile
    SiriusProfileViewController* profile = [[SiriusProfileViewController alloc] initWithNibName:@"SiriusProfileViewController" bundle:nil]; //qui metti user
    UINavigationController* navProfile = [[UINavigationController alloc] initWithRootViewController:profile];
    
    //Activity
    SiriusActivityViewController* act = [[SiriusActivityViewController alloc] initWithNibName:@"SiriusActivityViewController" bundle:nil];
    UINavigationController* navAct = [[UINavigationController alloc] initWithRootViewController:act];
    
    //camera
    SiriusCameraViewController* cam = [[SiriusCameraViewController alloc] initWithNibName:@"SiriusCameraViewController" bundle:nil];
    UINavigationController* navCam = [[UINavigationController alloc] initWithRootViewController:cam];
    
    
    [self.tabController setViewControllers:@[navFeed, navCam, navAct, navProfile]];
    [self.tabController addCenterButtonWithImage:[UIImage imageNamed:@"tab_icon_camera_off"] highlightImage:nil];
    
    /*TODO:UI APPEARANCE*/
    
    /*[ [UITabBarItem appearance] setTitleTextAttributes:@{
     UITextAttributeTextColor: COLORS_TITLE_TEXT,
     UITextAttributeTextShadowColor: [UIColor clearColor],
     UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
     UITextAttributeFont: [UIFont fontWithName:@"TrajanPro-Regular" size:8]}
     
     forState: UIControlStateNormal];
     
     [ [UITabBarItem appearance] setTitleTextAttributes:@{
     UITextAttributeTextColor: COLORS_TEXT_TABBAR_SELECTED,
     UITextAttributeTextShadowColor: [UIColor clearColor],
     UITextAttributeTextShadowOffset: [NSValue valueWithUIOffset:UIOffsetMake(0, 1)],
     UITextAttributeFont: [UIFont fontWithName:@"TrajanPro-Regular" size:8]}
     
     forState: UIControlStateSelected];
     */
    
    //Tabs
    UIEdgeInsets tabInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    //[navFeed.tabBarItem setFinishedSelectedImage:[[UIImage imageNamed:@"tab_icon_home_on"]
    //                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
    //             withFinishedUnselectedImage:[[UIImage imageNamed:@"tab_icon_home_off"]
    //                                        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    navFeed.tabBarItem.title = @"FEED";
    navFeed.tabBarItem.imageInsets = tabInsets;
    
    //        [navFeed.tabBarItem setFinishedSelectedImage:nil
    //                      withFinishedUnselectedImage:nil];
    navCam.tabBarItem.title = @"CAMERA";
    navCam.tabBarItem.imageInsets = tabInsets;
    
    //       [navAct.tabBarItem setFinishedSelectedImage:[[UIImage imageNamed:@"tab_icon_activity_on"]
    //                                                imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
    //             withFinishedUnselectedImage:[[UIImage imageNamed:@"tab_icon_activity_off"]
    //                                      imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    navAct.tabBarItem.title = @"ACTIVITY";
    navAct.tabBarItem.imageInsets = tabInsets;
    
    
    //     [navProfile.tabBarItem setFinishedSelectedImage:[[UIImage imageNamed:@"tab_icon_profile_on"]
    //                                                  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
    //                   withFinishedUnselectedImage:[[UIImage imageNamed:@"tab_icon_profile_off"]
    //                                            imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    navProfile.tabBarItem.title = @"PROFILE";
    navProfile.tabBarItem.imageInsets = tabInsets;
    
    
    //TAB BAR
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_bar_back"]];
    
    
    OSCHECK_IF_IOS7_OR_GREATER(
                               [self.tabController.tabBar setSelectionIndicatorImage:[UIImage imageNamed:@"background_selected_tab"]];
                               )
    OSCHECK_IF_PRE_IOS7(
                        [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"background_selected_tab"]];
                        )
    
    //NAVIGATION BAR
    
    //        OSCHECK_IF_IOS7_OR_GREATER(
    //                                 [[UINavigationBar appearance] setTintColor:COLORS_NAV_TEXT];
    //[[UINavigationBar appearance] setBarTintColor:COLORS_NAV_BAR];
    //                               )
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"background_tile_actionbar"] forBarMetrics:UIBarMetricsDefault];
    
    //    [[UINavigationBar appearance] setTitleTextAttributes: @{
    //                                                          UITextAttributeTextColor:COLORS_NAV_TEXT,
    //                                                        UITextAttributeTextShadowColor:[UIColor clearColor],
    //                                                      UITextAttributeFont:[UIFont fontWithName:@"TrajanPro-Regular" size:17]
    //                                                    }];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage imageNamed:@"navbar-shadow.png"] ];
    
    //[[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor: COLORS_HOME_TEXTHIGH];
    
    [[UIBarButtonItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, 10) forBarMetrics:UIBarMetricsDefault];
    
    [self.window makeKeyAndVisible];
    
    //}
    
}

// ****************************************************************************
// App switching methods to support Facebook Single Sign-On.
// ****************************************************************************
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    [[PFFacebookUtils session] close];
}

@end
