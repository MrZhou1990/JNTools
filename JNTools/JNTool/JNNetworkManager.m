//
//  JNNetworkManager.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "JNNetworkManager.h"
/* -----获取终端IP地址用----- */
#include <ifaddrs.h>
#include <arpa/inet.h>
#include <net/if.h>
#define IOS_CELLULAR    @"pdp_ip0"
#define IOS_WIFI        @"en0"
#define IOS_VPN         @"utun0"
#define IP_ADDR_IPv4    @"ipv4"
#define IP_ADDR_IPv6    @"ipv6"
/* -----获取终端IP地址用----- */
#import <AFNetworking/AFNetworking.h>
#import "MBProgressHUD+JNExtension.h"

@implementation JNNetworkManager

#pragma mark - 获取终端IP地址
+ (NSString *)jn_getIPAddress:(BOOL)preferIPv4 {
    /*
     需要引入一下头文件及定义宏
     #include <ifaddrs.h>
     #include <arpa/inet.h>
     #include <net/if.h>
     #define IOS_CELLULAR    @"pdp_ip0"
     #define IOS_WIFI        @"en0"
     #define IOS_VPN         @"utun0"
     #define IP_ADDR_IPv4    @"ipv4"
     #define IP_ADDR_IPv6    @"ipv6"
     */
    NSArray *searchArray = preferIPv4 ?
    @[ IOS_WIFI @"/" IP_ADDR_IPv4, IOS_WIFI @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6 ] :
    @[ IOS_WIFI @"/" IP_ADDR_IPv6, IOS_WIFI @"/" IP_ADDR_IPv4, IOS_CELLULAR @"/" IP_ADDR_IPv6, IOS_CELLULAR @"/" IP_ADDR_IPv4 ] ;
    NSDictionary *addresses = [self getIPAddresses];
    __block NSString *address;
    [searchArray enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        address = addresses[key];
        if(address) *stop = YES;
    }];
    return address ? address : @"0.0.0.0";
}

+ (NSDictionary *)getIPAddresses {
    NSMutableDictionary *addresses = [NSMutableDictionary dictionaryWithCapacity:8];
    // retrieve the current interfaces - returns 0 on success
    //  导入ifaddrs.h
    struct ifaddrs *interfaces;
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        struct ifaddrs *interface;
        for(interface=interfaces; interface; interface=interface->ifa_next) {
            if(!(interface->ifa_flags & IFF_UP) || (interface->ifa_flags & IFF_LOOPBACK)) {
                continue; // deeply nested code harder to read  IFF_UP需要导入头文件
            }
            const struct sockaddr_in *addr = (const struct sockaddr_in*)interface->ifa_addr;
            if(addr && (addr->sin_family==AF_INET || addr->sin_family==AF_INET6)) {
                NSString *name = [NSString stringWithUTF8String:interface->ifa_name];
                char addrBuf[INET6_ADDRSTRLEN];
                if(inet_ntop(addr->sin_family, &addr->sin_addr, addrBuf, sizeof(addrBuf))) {
                    NSString *key = [NSString stringWithFormat:@"%@/%@", name, addr->sin_family == AF_INET ? IP_ADDR_IPv4 : IP_ADDR_IPv6];
                    addresses[key] = [NSString stringWithUTF8String:addrBuf];
                }
            }
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    // The dictionary keys have the form "interface" "/" "ipv4 or ipv6"
    return [addresses count] ? addresses : nil;
}

#pragma mark - 网络请求封装
+ (AFHTTPSessionManager *)jn_setupManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"text/plain",
                                                         @"text/json",
                                                         @"application/json",
                                                         @"text/javascript",
                                                         @"text/html",
                                                         @"application/javascript",
                                                         @"text/js",
                                                         nil];
    return manager;
}
// 没有加载等待的GET请求
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure {
    AFHTTPSessionManager *manager = [self jn_setupManager];
    // 发送get请求
    [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

// 有加载等待的GET请求
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                        loadString:(NSString *)loadString
                            toView:(UIView *)view
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure
{
    [MBProgressHUD jn_loadingMessage:loadString toView:view];
    [self jn_getRequestWithUrlString:urlString parameters:parameters success:^(id responObject) {
        [MBProgressHUD jn_hideHUDForView:view];
        success(responObject);
    } failure:^(NSError *error) {
        [MBProgressHUD jn_hideHUDForView:view];
        failure(error);
    }];
}

// 没有加载等待的POST请求
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure {
    AFHTTPSessionManager *manager = [self jn_setupManager];
    // 发送post请求
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

// 有加载等待的POST请求
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                         loadString:(NSString *)loadString
                             toView:(UIView *)view
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure {
    [MBProgressHUD jn_loadingMessage:loadString toView:view];
    [self jn_postRequestWithUrlString:urlString parameters:parameters success:^(id responObject) {
        [MBProgressHUD jn_hideHUDForView:view];
        success(responObject);
    } failure:^(NSError *error) {
        [MBProgressHUD jn_hideHUDForView:view];
        failure(error);
    }];
}

@end
