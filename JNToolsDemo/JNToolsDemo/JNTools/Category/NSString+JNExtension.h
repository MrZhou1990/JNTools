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

@end

NS_ASSUME_NONNULL_END
