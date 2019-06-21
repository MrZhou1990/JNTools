//
//  JNToolsDefine.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/21.
//  Copyright © 2019 Cloud. All rights reserved.
//

#ifndef JNToolsDefine_h
#define JNToolsDefine_h

/** 打印 */
#ifdef DEBUG
#define JNLog(...) NSLog(@"\n类、方法名%s，第%d行\n%@\n--------------------------分割线--------------------------", __func__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define JNLog(...)
#endif

/** RGB设置颜色 */
#define JNRGBColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

/** 随机颜色生成 */
#define JNRandomColor [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1]

#endif /* JNToolsDefine_h */
