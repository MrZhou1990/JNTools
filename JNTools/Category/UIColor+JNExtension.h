//
//  UIColor+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/23.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JNExtension)

/**
 哈希码取色
 
 @param hexString 哈希码
 @param alpha 透明度
 @return 返回哈希码颜色
 */
+ (UIColor *)jn_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
