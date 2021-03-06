//
//  ADAppDelegate.m
//  ADTransitionController
//
//  Created by Pierre Felgines on 27/05/13.
//  Copyright (c) 2013 Applidium. All rights reserved.
//

#import "ALAppDelegate.h"
#import "ADTransitionController.h"
#import "ALTransitionTestViewController.h"
#import "ADNavigationControllerDelegate.h"

@interface ALAppDelegate () {
    ADNavigationControllerDelegate * _navigationDelegate;
}

@end

@implementation ALAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Setup transitionController
    ALTransitionTestViewController * viewController = [[ALTransitionTestViewController alloc] initWithNibName:nil bundle:nil index:0];
    UIViewController * transitionController = nil;
    transitionController = [[UINavigationController alloc] initWithRootViewController:viewController];
    _navigationDelegate = [[ADNavigationControllerDelegate alloc] init];
    ((UINavigationController *)transitionController).delegate = _navigationDelegate;
    self.window.rootViewController = transitionController;

    // Setup appearance
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage imageNamed:@"ALNavigationBarBackground"] stretchableImageWithLeftCapWidth:1.0f topCapHeight:1.0f] forBarMetrics:UIBarMetricsDefault];
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(-1.0f, 0);
    NSDictionary * navigationBarTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                   NSShadowAttributeName: shadow};
    [[UINavigationBar appearance] setTitleTextAttributes:navigationBarTextAttributes];

    [[UIToolbar appearance] setBackgroundImage:[[UIImage imageNamed:@"ALNavigationBarBackground"] stretchableImageWithLeftCapWidth:1.0f topCapHeight:1.0f] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];

    // Remove status bar
    [UIApplication sharedApplication].statusBarHidden = YES;

    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
