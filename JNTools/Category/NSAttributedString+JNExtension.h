//
//  NSAttributedString+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/23.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (JNExtension)

/**
 添加删除线的属性文字
 
 @param deleteText 文字
 @param deleteTextFont 字号
 @param deleteTextColor 字色
 @param deleteLineColor 删除线颜色
 @return 返回添加删除线的属性文字
 */
+ (NSAttributedString *)jn_deleteLineAttributedStringWithDeleteText:(NSString *)deleteText
                                                     deleteTextFont:(UIFont *)deleteTextFont
                                                    deleteTextColor:(UIColor *)deleteTextColor
                                                    deleteLineColor:(UIColor *)deleteLineColor;

@end

NS_ASSUME_NONNULL_END
