JNTools是一款用于iOS手机端开发的工具类及一些常用三方工具类的二次封装
# 使用方法
```
pod 'JNTools', '0.0.4'
```
# 依赖系统框架及三方框架
JNNetworkManager.m

依赖：#include <ifaddrs.h>、#include <arpa/inet.h>、#include <net/if.h>、#import <AFNetworking/AFNetworking.h>、#import "MBProgressHUD+JNExtension.h"
***
UIImageView+JNExtension.m

依赖：#import <UIImageView+WebCache.h>
***
NSString+JNExtension.m

依赖：#import <CommonCrypto/CommonDigest.h>
# JNTool/JNNetworkManager.h
```
/**
 获取当前终端IP地址
 
 @param preferIPv4 是否是IPV4
 @return 返回当前终端IP地址
 */
+ (NSString *)jn_getIPAddressWithIPv4:(BOOL)preferIPv4;

/**
 有加载等待的GET请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param loadString 等待的文字
 @param view 遮罩的图层
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                        loadString:(NSString *)loadString
                            toView:(UIView *)view
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure;

/**
 没有加载等待的GET请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_getRequestWithUrlString:(NSString *)urlString
                        parameters:(id)parameters
                           success:(void (^) (id responObject))success
                           failure:(void (^) (NSError *error))failure;

/**
 有加载等待的POST请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param loadString 等待的文字
 @param view 遮罩的图层
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                         loadString:(NSString *)loadString
                             toView:(UIView *)view
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure;

/**
 没有加载等待的POST请求
 
 @param urlString 请求的接口
 @param parameters 请求的参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)jn_postRequestWithUrlString:(NSString *)urlString
                         parameters:(id)parameters
                            success:(void (^) (id responObject))success
                            failure:(void (^) (NSError *error))failure;
```
# JNTool/JNTool.h
```
/**
 动态生成字典的模型，从服务器获取json数据时需要定义大量的属性字段，用这个方法直接生成，在打印区复制粘贴
 
 @param dict 需要生成模型的字典
 */
+ (void)jn_createPropertyCodeWithDict:(NSDictionary *)dict;

/**
 产生一个随机数
 
 @param max 随机数最大值
 @param min 随机数最小值
 @return min - max 之间的随机数
 */
+ (NSInteger)jn_randomNumberWithMax:(NSInteger)max min:(NSInteger)min;

/**
 判断一段字符串是否为空字符串
 
 @param text 需要判断的字符串
 @return 返回字符串是否为空字符串
 */
+ (BOOL)jn_textIsSpace:(NSString *)text;

/**
 获取缓存大小
 
 @return 返回缓存大小
 */
+ (NSString *)jn_getCacheSize;

/**
 清空缓存并返回清空缓存后的文件夹大小用来更新显示
 
 @return 返回清空缓存后的文件夹大小用来更新显示
 */
+ (NSString *)jn_cleanCache;

/**
 App是否为新版本

 @return 返回是否是新版本
 */
+ (BOOL)jn_isNewVersion;
```
# Define/JNToolsDefine.h(宏定义工具)
```
/** 打印 */
#ifdef DEBUG
#define JNLog(FORMAT, ...) fprintf(stderr, "%s:%d\t%s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
#define JNLog(...)
#endif

/** RGB设置颜色 */
#define JNRGBColor(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]

/** 随机颜色生成 */
#define JNRandomColor [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1]
```
# Category/MBProgressHUD+JNExtension.h
```
/**
 提示一段可以换行的文字
 
 @param message 提示的文字
 @param view 文字框加载的视图上
 @return 返回实例
 */
+ (MBProgressHUD *)jn_promptMessage:(NSString *)message toView:(UIView *)view;

/**
 提示一段可以换行的文字默认加在window上
 
 @param message 提示的文字
 @return 返回实例
 */
+ (MBProgressHUD *)jn_promptMessage:(NSString *)message;

/**
 有提示文字的加载菊花
 
 @param message 提示文字
 @param view 文字框加载的视图上
 @return 返回实例
 */
+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message toView:(UIView *)view;

/**
 有提示文字的加载菊花默认加在window上
 
 @param message 提示文字
 @return 返回实例
 */
+ (MBProgressHUD *)jn_loadingMessage:(NSString *)message;

/**
 隐藏加载菊花
 
 @param view 文字框加载的视图上
 */
+ (void)jn_hideHUDForView:(UIView *)view;

/**
 隐藏加载菊花默认隐藏window上的
 */
+ (void)jn_hideHUD;
```
# Category/NSAttributedString+JNExtension.h
```
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
```
# Category/NSDate+JNExtension.h
```
/**
 获取时间戳
 
 @return 返回时间戳
 */
+ (NSString *)jn_dateTimeStamp;

/**
 获取当前系统时间
 
 @param dateType 日期类型
 @return 返回当前系统时间
 */
+ (NSString *)jn_currentSystemTimeWithDateType:(JNDateType)dateType;

/**
 在当前日期延后N个月
 
 @param months 延后的月数
 @return 返回延后月份的日期
 */
+ (NSDate *)jn_dateByAddingMonths:(NSInteger)months;

/**
 在当前日期的基础上, 加多少天
 
 @param dDays 添加的天数
 @return 返回添加天数后的日期
 */
- (NSDate *)jn_dateByAddingDays:(NSInteger)dDays;

/**
 在当前日期的基础上, 减多少天
 
 @param dDays 减去的天数
 @return 返回减去天数后的日期
 */
- (NSDate *)jn_dateBySubtractingDays:(NSInteger)dDays;

/**
 在当前日期加多少小时
 
 @param dHours 小时
 @return 加小时候的日期
 */
- (NSDate *)jn_dateByAddingHours:(NSInteger)dHours;

/**
 在当前日期减多少小时
 
 @param dHours 小时
 @return 减小时后的日期
 */
- (NSDate *)jn_dateBySubtractingHours:(NSInteger)dHours;

/**
 在当前日期加多少分钟
 
 @param dMinutes 加分钟
 @return 加分钟后的日期
 */
- (NSDate *)jn_dateByAddingMinutes:(NSInteger)dMinutes;

/**
 在当前日期减多少分钟
 
 @param dMinutes 减分钟
 @return 减分钟后的日期
 */
- (NSDate *)jn_dateBySubtractingMinutes:(NSInteger)dMinutes;

/**
 根据日期获取农历
 
 @param date 要获取农历的日期
 @return 返回相应日期的农历
 */
+ (NSString*)jn_getChineseCalendarWithDate:(NSDate *)date;
```
# Category/NSString+JNExtension.h
```
/**
 将当前字符串进行MD5加密

 @return 返回MD5加密后的字符串
 */
- (NSString *)jn_md5String;
```
# Category/UIColor+JNExtension.h
```
/**
 哈希码取色
 
 @param hexString 哈希码
 @param alpha 透明度
 @return 返回哈希码颜色
 */
+ (UIColor *)jn_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
```
# Category/UIImage+JNExtension.h
```
/**
 一张图片的原始图片, 取消系统的图片渲染
 
 @param imageName 图片名字
 @return 返回未渲染的图片
 */
+ (UIImage *)jn_imageWithOriginalImage:(NSString *)imageName;

/**
 高斯模糊图片
 
 @param theImage 原图片
 @param radius 模糊数值
 @return 返回高斯模糊后图片
 */
+ (UIImage *)jn_imageWithBlurImage:(UIImage *)theImage intputRadius:(CGFloat)radius;

/**
 改变一张图片的颜色
 
 @param color 要改变的颜色
 @return 返回改变颜色后的图片
 */
- (UIImage *)jn_imageWithColor:(UIColor *)color;


/**
 使照片裁剪之后不会旋转
 
 @param aImage 要设置的照片
 @return 返回为原始方向的照片
 */
- (UIImage *)jn_imageFixOrientation:(UIImage *)aImage;

/**
 根据字符串生成二维码
 
 @param string 需要生成二维码的字符串
 @return 返回生成的二维码
 */
+ (UIImage *)jn_createQRCodeWithString:(NSString *)string;

/**
 获取视频的第一帧图片
 
 @param path 视频所在沙盒的路径
 @return 返回视频的第一帧图片
 */
+ (UIImage *)jn_getVideoPreViewImage:(NSURL *)path;
```
# Category/UIImageView+JNExtension.h
```
/**
 加载一张网络图片
 
 @param imageUrlString 网络图片链接
 @param placeholderImage 本地占位图
 */
- (void)jn_setImageWithImageUrlString:(NSString *)imageUrlString placeholderImage:(UIImage *)placeholderImage;
```
# Category/UILabel+JNExtension.h
```
/**
 改变label的行高
 
 @param space 需要设置的行高
 */
- (void)zh_changeLineWithSpace:(float)space;
```
# Category/UIView+JNExtension.h
```
@property(nonatomic, assign)CGFloat x;
@property(nonatomic, assign)CGFloat y;
@property(nonatomic, assign)CGFloat centerX;
@property(nonatomic, assign)CGFloat centerY;
@property(nonatomic, assign)CGFloat width;
@property(nonatomic, assign)CGFloat height;
@property(nonatomic, assign)CGSize size;
@property(nonatomic, assign)CGPoint origin;
// 拓展系统的属性，方便调用。例如：self.view.frame.size.width, 添加此分类后可直接self.view.width
```
- 后续还会持续更新
- 如有需要添加方法也可联系作者
- QQ：928092
- 微信：qq928092
- 邮箱：haohao10987@163.com

