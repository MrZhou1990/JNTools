//
//  MBProgressHUD+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (JNExtension)

/**
 提示一段可以换行的文字
 
 @param message 提示的文字
 @param view 文字框加载的视图上
 @return 返回实例
 */
+ (MBProgressHUD *)jn_promptMessage:(NSString *)message toView:(UIView *)view;

/**
 提示一段可以换行的文字默认加在window上
 
 @param message 提示的文字
 @return 返回实例
 */
+ (MBProgressHUD *)jn_promptMessage:(NSString *)message;

/**
 有提示文字的加载菊花
 
 @param message 提示文字
 @param view 文字框加载的视图上
 @return 返回实例
 */
+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message toView:(UIView *)view;

/**
 有提示文字的加载菊花默认加在window上
 
 @param message 提示文字
 @return 返回实例
 */
+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message;

/**
 隐藏加载菊花
 
 @param view 文字框加载的视图上
 */
+ (void)jn_hideHUDForView:(UIView *)view;

/**
 隐藏加载菊花默认隐藏window上的
 */
+ (void)jn_hideHUD;

@end
