//
//  NSDate+JNExtension.h
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JNExtension)

typedef NS_ENUM(NSUInteger, JNDateType) {
    /** 年月日，时分秒 */
    JNDateTypeYearMonthDayHourMinuteSecond,
    /** 年月日，时分 */
    JNDateTypeYearMonthDayHourMinute,
    /** 年月日，时 */
    JNDateTypeYearMonthDayHour,
    /** 年月日 */
    JNDateTypeYearMonthDay,
    /** 年月 */
    JNDateTypeYearMonth,
    /** 年 */
    JNDateTypeYear,
};

/**
 获取时间戳
 
 @return 返回时间戳
 */
+ (NSString *)jn_dateTimeStamp;

/**
 获取当前系统时间

 @param dateType 日期类型
 @param is24Hour 是否使用24小时制
 @return 返回当前系统时间
 */
+ (NSString *)jn_currentSystemTimeWithDateType:(JNDateType)dateType is24Hour:(BOOL)is24Hour;

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

/**
 获取日期的零点

 @return 返回日期的零点
 */
- (NSDate *)jn_dateZero;

@end

NS_ASSUME_NONNULL_END
