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
#define JNLog(FORMAT, ...) NSLog((@"\nMethod: %s\nLine: %d\n" FORMAT), __func__, __LINE__, ##__VA_ARGS__);
#else
#define JNLog(...)
#endif

/** 字符串是否为nil或@“” */
#define isEmpty(str) (str == nil || [@"" isEqual:str] ? true : false)

#endif /* JNToolsDefine_h */
