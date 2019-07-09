//
//  NSDate+JNExtension.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/24.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "NSDate+JNExtension.h"

#define D_MINUTE 60
#define D_HOUR   3600
#define D_DAY    86400
#define D_WEEK   604800
#define D_YEAR   31556926

@implementation NSDate (JNExtension)

#pragma mark - 获取时间戳
+ (NSString *)jn_dateTimeStamp {
    // 获取当前系统时间
    NSDate *date = [NSDate date];
    // 转换成时间戳
    NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    return timestamp;
}

#pragma mark - 获取当前系统时间
+ (NSString *)jn_currentSystemTimeWithDateType:(JNDateType)dateType {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (dateType) {
        case JNDateTypeYear:
            [dateFormatter setDateFormat:@"yyyy"];
            break;
        case JNDateTypeYearMonth:
            [dateFormatter setDateFormat:@"yyyy-MM"];
            break;
        case JNDateTypeYearMonthDay:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case JNDateTypeYearMonthDayHour:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh"];
            break;
        case JNDateTypeYearMonthDayHourMinute:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm"];
            break;
        case JNDateTypeYearMonthDayHourMinuteSecond:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            break;
        default:
            [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
            break;
    }
    return [dateFormatter stringFromDate:[NSDate date]];
}

#pragma mark - 在当前日期延后几个月
+ (NSDate *)jn_dateByAddingMonths:(NSInteger)months {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[NSDate date]];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setMonth:months];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:[NSDate date] options:0];
    return newdate;
}

#pragma mark - 在当前日期加多少天
- (NSDate *)jn_dateByAddingDays:(NSInteger)dDays {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_DAY * dDays;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 在当前日期减多少天
- (NSDate *)jn_dateBySubtractingDays:(NSInteger)dDays {
    return [self jn_dateByAddingDays:(dDays * -1)];
}

#pragma mark - 在当前日期加多少小时
- (NSDate *)jn_dateByAddingHours:(NSInteger)dHours {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 在当前日期减多少小时
- (NSDate *)jn_dateBySubtractingHours:(NSInteger)dHours {
    return [self jn_dateByAddingHours:(dHours * -1)];
}

#pragma mark - 在当前日期加多少分钟
- (NSDate *)jn_dateByAddingMinutes:(NSInteger)dMinutes {
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - 在当前日期减多少分钟
- (NSDate *)jn_dateBySubtractingMinutes:(NSInteger)dMinutes {
    return [self jn_dateByAddingMinutes: (dMinutes * -1)];
}

#pragma mark - 根据日期获取中国农历
+ (NSString*)jn_getChineseCalendarWithDate:(NSDate *)date {
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯", @"戊辰", @"己巳", @"庚午", @"辛未", @"壬申", @"癸酉",
                             @"甲戌", @"乙亥", @"丙子", @"丁丑", @"戊寅", @"己卯", @"庚辰", @"辛己", @"壬午", @"癸未",
                             @"甲申", @"乙酉", @"丙戌", @"丁亥", @"戊子", @"己丑", @"庚寅", @"辛卯", @"壬辰", @"癸巳",
                             @"甲午", @"乙未", @"丙申", @"丁酉", @"戊戌", @"己亥", @"庚子", @"辛丑", @"壬寅", @"癸丑",
                             @"甲辰", @"乙巳", @"丙午", @"丁未", @"戊申", @"己酉", @"庚戌", @"辛亥", @"壬子", @"癸丑",
                             @"甲寅", @"乙卯", @"丙辰", @"丁巳", @"戊午", @"己未", @"庚申", @"辛酉", @"壬戌", @"癸亥", nil];
    NSArray *chineseMonths = [NSArray arrayWithObjects:
                              @"正月", @"二月", @"三月", @"四月", @"五月", @"六月",
                              @"七月", @"八月", @"九月", @"十月", @"冬月", @"腊月", nil];
    NSArray *chineseDays = [NSArray arrayWithObjects:
                            @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                            @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                            @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十", nil];
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year - 1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month - 1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day - 1];
    NSString *chineseCal_str =[NSString stringWithFormat:@"%@_%@_%@",y_str,m_str,d_str];
    return chineseCal_str;
}

@end
