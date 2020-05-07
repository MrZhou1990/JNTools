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

/// 哈希码取色
/// @param hexString 哈希码
+ (UIColor *)jn_colorWithHexString:(NSString *)hexString;

/**
 生成一个随机色

 @return 一个随机色
 */
+ (UIColor *)jn_colorWithRandomColor;

/**
 RGB取色

 @param r red
 @param g green
 @param b blue
 @param a alpha
 @return RGB取色
 */
+ (UIColor *)jn_colorWithRGBColorRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a;

/// RGB取色
/// @param r red
/// @param g green
/// @param b blue
+ (UIColor *)jn_colorWithRGBColorRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b;

@end

NS_ASSUME_NONNULL_END
