//
//  JNNetworkManager.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNNetworkManager : NSObject

/**
 获取当前终端IP地址
 
 @param preferIPv4 是否是IPV4
 @return 返回当前终端IP地址
 */
+ (NSString *)jn_getIPAddress:(BOOL)preferIPv4;

/**
 有加载等待的GET请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param loadString 等待的文字
 @param view 遮罩的图层
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                        loadString:(NSString *)loadString
                            toView:(UIView *)view
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure;

/**
 没有加载等待的GET请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure;

/**
 有加载等待的POST请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param loadString 等待的文字
 @param view 遮罩的图层
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                         loadString:(NSString *)loadString
                             toView:(UIView *)view
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure;

/**
 没有加载等待的POST请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure;

@end
