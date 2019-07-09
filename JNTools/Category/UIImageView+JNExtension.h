//
//  UIImageView+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (JNExtension)

/**
 加载一张网络图片
 
 @param imageUrlString 网络图片链接
 @param placeholderImage 本地占位图
 */
- (void)jn_setImageWithImageUrlString:(NSString *)imageUrlString placeholderImage:(UIImage *)placeholderImage;

@end

NS_ASSUME_NONNULL_END
