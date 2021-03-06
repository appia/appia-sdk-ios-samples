//
//  APAppDelegate.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APAppDelegate.h"
#import "ECSlidingViewController.h"
#import <AppiaSDK/Appia.h>

@implementation APAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //initialize Appia
    AIAppia *appia = [AIAppia sharedInstance];
    appia.siteId = @"3863";
    
    //cache the app wall upon launch to improve performance
    //[[AIAppia sharedInstance] cacheAppWall];
    
    // Override point for customization after application launch.
    ECSlidingViewController *slidingVC = (ECSlidingViewController *)self.window.rootViewController;
    
    UIViewController *topVC = [slidingVC.storyboard instantiateViewControllerWithIdentifier:@"postList"];
    
    [slidingVC setTopViewController:topVC];
    [slidingVC setResetStrategy:ECPanning|ECTapping];
    [slidingVC setAnchorRightPeekAmount:30.0];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
