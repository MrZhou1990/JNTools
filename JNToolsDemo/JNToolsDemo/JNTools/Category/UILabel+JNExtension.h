//
//  UILabel+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (JNExtension)

/**
 改变label的行高
 
 @param space 需要设置的行高
 */
- (void)jn_changeLineWithSpace:(float)space;

@end

NS_ASSUME_NONNULL_END
