//
//  NSAttributedString+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/23.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "NSAttributedString+JNExtension.h"

@implementation NSAttributedString (JNExtension)

// 添加删除线的属性文字
+ (NSAttributedString *)jn_deleteLineAttributedStringWithDeleteText:(NSString *)deleteText
                                                     deleteTextFont:(UIFont *)deleteTextFont
                                                    deleteTextColor:(UIColor *)deleteTextColor
                                                    deleteLineColor:(UIColor *)deleteLineColor {
    NSDictionary *attributes = @{NSFontAttributeName : deleteTextFont,
                                 NSForegroundColorAttributeName : deleteTextColor,
                                 NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid),
                                 NSStrikethroughColorAttributeName : deleteLineColor};
    return [[NSAttributedString alloc] initWithString:deleteText attributes:attributes];
}

@end
