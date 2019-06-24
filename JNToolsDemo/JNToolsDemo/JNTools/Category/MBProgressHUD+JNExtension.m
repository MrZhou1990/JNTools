//
//  MBProgressHUD+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "MBProgressHUD+JNExtension.h"

@implementation MBProgressHUD (JNExtension)

+ (MBProgressHUD *)jn_setupHUDTo:(UIView *)view {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];        
    });
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.color = [UIColor blackColor];
    hud.label.textColor = [UIColor whiteColor];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (MBProgressHUD *)jn_promptMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD jn_setupHUDTo:view];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = message;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15.f];
    [hud hideAnimated:YES afterDelay:1.5];
    return hud;
}

+ (MBProgressHUD *)jn_promptMessage:(NSString *)message {
    MBProgressHUD *hud = [self jn_promptMessage:message toView:nil];
    return hud;
}

+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD jn_setupHUDTo:view];
    hud.label.text = message;
    return hud;
}

+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message {
    MBProgressHUD *hud = [self jn_loadingMessage:message toView:nil];
    return hud;
}

+ (void)jn_hideHUDForView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)jn_hideHUD {
    [self jn_hideHUDForView:nil];
}

@end
