//
//  JNTool.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/23.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JNTool : NSObject

/**
 动态生成字典的模型，从服务器获取json数据时需要定义大量的属性字段，用这个方法直接生成，在打印区复制粘贴
 
 @param dict 需要生成模型的字典
 */
+ (void)jn_createPropertyCodeWithDict:(NSDictionary *)dict;

/**
 产生一个随机数
 
 @param max 随机数最大值
 @param min 随机数最小值
 @return min - max 之间的随机数
 */
+ (NSInteger)jn_randomNumberWithMax:(NSInteger)max min:(NSInteger)min;

/**
 获取缓存大小
 
 @return 返回缓存大小
 */
+ (NSString *)jn_getCacheSize;

/**
 清空缓存并返回清空缓存后的文件夹大小用来更新显示
 
 @return 返回清空缓存后的文件夹大小用来更新显示
 */
+ (NSString *)jn_cleanCache;

/**
 获取当前终端IP地址
 
 @param preferIPv4 是否是IPV4
 @return 返回当前终端IP地址
 */
+ (NSString *)jn_getIPAddressWithIPv4:(BOOL)preferIPv4;

/**
 a + b
 */
+ (NSString *)jn_A:(NSString *)a add_B:(NSString *)b;

/**
 a - b
 */
+ (NSString *)jn_A:(NSString *)a subtract_B:(NSString *)b;

/**
 a * b
 */
+ (NSString *)jn_A:(NSString *)a multiply_B:(NSString *)b;

/**
 a / b
 */
+ (NSString *)jn_A:(NSString *)a divide_B:(NSString *)b;

@end

NS_ASSUME_NONNULL_END
