//
//  JNNetworkManager.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNNetworkManager : NSObject

/**
 获取当前终端IP地址
 
 @param preferIPv4 是否是IPV4
 @return 返回当前终端IP地址
 */
+ (NSString *)jn_getIPAddress:(BOOL)preferIPv4;


@end

NS_ASSUME_NONNULL_END
