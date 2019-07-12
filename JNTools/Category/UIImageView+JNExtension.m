//
//  UIImageView+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "UIImageView+JNExtension.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (JNExtension)

// 加载一张网络图片
- (void)jn_setImageWithImageUrlString:(NSString *)imageUrlString placeholderImage:(UIImage *)placeholderImage {
    if (placeholderImage) {
        [self sd_setImageWithURL:[NSURL URLWithString:imageUrlString] placeholderImage:placeholderImage];
    } else {
        [self sd_setImageWithURL:[NSURL URLWithString:imageUrlString]];
    }
}

@end
