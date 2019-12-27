//
//  AppDelegate.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/9/3.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    TestViewController *vc = [[TestViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    _window.rootViewController = nav;
    [_window makeKeyWindow];
    
    return YES;
}

@end
