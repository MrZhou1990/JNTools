//
//  NSString+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/21.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JNExtension)

/**
 将当前字符串进行MD5加密

 @return 返回MD5加密后的字符串
 */
- (NSString *)jn_md5String;

/**
 拼接沙盒中Document文件夹的文件路径
 
 @return 沙盒中Document文件夹的文件路径
 */
- (NSString *)jn_documentDir;

/**
 拼接沙盒中Caches（缓存）文件夹的文件路径

 @return 沙盒中Caches（缓存）文件夹的文件路径
 */
- (NSString *)jn_cachesDir;

/**
 拼接沙盒中Tmp（临时）文件夹的文件路径

 @return 沙盒中Tmp（临时）文件夹的文件路径
 */
- (NSString *)jn_tmpDir;

@end

NS_ASSUME_NONNULL_END
