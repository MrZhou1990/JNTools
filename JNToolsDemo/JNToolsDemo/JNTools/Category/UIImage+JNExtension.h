//
//  UIImage+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (JNExtension)

/**
 一张图片的原始图片, 取消系统的图片渲染
 
 @param imageName 图片名字
 @return 返回未渲染的图片
 */
+ (UIImage *)jn_imageWithOriginalImage:(NSString *)imageName;

/**
 高斯模糊图片
 
 @param theImage 原图片
 @param radius 模糊数值
 @return 返回高斯模糊后图片
 */
+ (UIImage *)jn_imageWithBlurImage:(UIImage *)theImage intputRadius:(CGFloat)radius;

/**
 改变一张图片的颜色
 
 @param color 要改变的颜色
 @return 返回改变颜色后的图片
 */
- (UIImage *)jn_imageWithColor:(UIColor *)color;


/**
 使照片裁剪之后不会旋转
 
 @param aImage 要设置的照片
 @return 返回为原始方向的照片
 */
- (UIImage *)jn_imageFixOrientation:(UIImage *)aImage;

/**
 根据字符串生成二维码
 
 @param string 需要生成二维码的字符串
 @return 返回生成的二维码
 */
+ (UIImage *)jn_createQRCodeWithString:(NSString *)string;

/**
 获取视频的第一帧图片
 
 @param path 视频所在沙盒的路径
 @return 返回视频的第一帧图片
 */
+ (UIImage *)jn_getVideoPreViewImage:(NSURL *)path;

/**
 使用颜色创建一张图片

 @param color 颜色
 @param size 图片尺寸
 @return 返回Image对象
 */
+ (UIImage *)jn_createImageWithColor:(UIColor *)color size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
