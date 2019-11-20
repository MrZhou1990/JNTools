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
#define JNLog(FORMAT, ...) fprintf(stderr, "类名：%s\n方法名：%s\n行号：%d\n%s\n**********\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __func__, __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define JNLog(...)
#endif

#endif /* JNToolsDefine_h */
