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
 判断一段字符串是否为空字符串
 
 @param text 需要判断的字符串
 @return 返回字符串是否为空字符串
 */
+ (BOOL)jn_textIsSpace:(NSString *)text;

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
 App是否为新版本

 @return 返回是否是新版本
 */
+ (BOOL)jn_isNewVersion;

@end

NS_ASSUME_NONNULL_END
