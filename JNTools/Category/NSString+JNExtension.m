//
//  NSString+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/21.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "NSString+JNExtension.h"
#import <CommonCrypto/CommonDigest.h> // MD5加密需要导此包

@implementation NSString (JNExtension)

// 将当前字符串进行MD5加密
- (NSString *)jn_md5String {
    const char *cStr = self.UTF8String;
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

@end
