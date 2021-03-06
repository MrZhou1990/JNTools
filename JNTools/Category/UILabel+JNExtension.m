//
//  UILabel+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "UILabel+JNExtension.h"

@implementation UILabel (JNExtension)

#pragma mark - 改变label的行高
- (void)jn_changeLineWithSpace:(float)space {
    
    NSString *labelText = self.text;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    
    self.attributedText = attributedString;
    [self sizeToFit];
    self.lineBreakMode = NSLineBreakByTruncatingTail;
}

@end
