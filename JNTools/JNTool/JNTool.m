//
//  JNTool.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/23.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "JNTool.h"

@implementation JNTool

#pragma mark - 动态生成字典的模型
+ (void)jn_createPropertyCodeWithDict:(NSDictionary *)dict {
    NSMutableString *strM = [NSMutableString string];
    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSString *code;
        // 查看每种数据类型
        //        NSLog(@"属性名：%@ - 数据类型： %@", propertyName, [value class]);
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")] || [value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, copy)NSString *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong)NSNumber *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")] || [value isKindOfClass:NSClassFromString(@"__NSArrayM")] || [value isKindOfClass:NSClassFromString(@"__NSArrayI")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong)NSArray *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")] || [value isKindOfClass:NSClassFromString(@"__NSDictionaryM")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong)NSDictionary *%@;", propertyName];
        } else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, assign)BOOL %@;", propertyName];
        }
        [strM appendFormat:@"\n%@\n",code];
    }];
#ifdef DEBUG
    NSLog(@"\n\n%@",strM);
#endif
}

#pragma mark - 获取一个随机数
+ (NSInteger)jn_randomNumberWithMax:(NSInteger)max min:(NSInteger)min {
    return arc4random() % (max - min + 1) + min;
}

#pragma mark - 判断一段字符串是否为空字符串
+ (BOOL)jn_textIsSpace:(NSString *)text {
    NSString *result = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [result isEqualToString:@""];
}

#pragma mark - 获取缓存大小
+ (NSString *)jn_getCacheSize {
    //找到沙盒Caches文件
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSString *cachePath = [path stringByAppendingPathComponent:@"Caches"];
    // 显示缓存路径
    //NSLog(@"缓存路径: %@", cachePath);
    //创建文件管理者
    NSFileManager *manage = [NSFileManager defaultManager];
    if (![manage fileExistsAtPath:cachePath]) {
        return @"0";
    }
    //根据路径获取文件夹里面的元素集合
    //获取集合类型的枚举器
    NSEnumerator *enumerator = [[manage subpathsAtPath:cachePath] objectEnumerator];
    //每次遍历得到的文件名
    NSString *fileName = [NSString string];
    //文件夹大小
    float folderSize = 0;
    while ((fileName = [enumerator nextObject]) != nil) {
        NSString *absolutePath = [cachePath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:absolutePath];
    }
    return  [NSString stringWithFormat:@"%.2fMB", folderSize / 1024.0 / 1024.0];
}

// 计算单个文件大小的方法
+ (long long)fileSizeAtPath:(NSString *)path {
    // 创建一个文件管理者
    NSFileManager *manage = [NSFileManager defaultManager];
    // 如果文件存在
    if ([manage fileExistsAtPath:path]) {
        return [[manage attributesOfItemAtPath:path error:nil] fileSize];
    }
    return 0;
}

#pragma mark - 清空缓存
+ (NSString *)jn_cleanCache {
    // 获取完整路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    path = [path stringByAppendingPathComponent:@"Caches"];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {
        NSArray *fileNameArray = [manager subpathsAtPath:path];
        for (NSString *fileName in fileNameArray) {
            // 拼接绝对路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 通过文件管理者删除文件
            [manager removeItemAtPath:absolutePath error:nil];
        }
    }
    // 返回清空缓存后的文件夹大小用来更新显示
    return [self jn_getCacheSize];
}

@end
