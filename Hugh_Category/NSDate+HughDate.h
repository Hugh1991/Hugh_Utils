//
//  NSDate+HughDate.h
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HughDate)

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

- (NSString *)timeIntervalDescription;//距离当前的时间间隔描述
- (NSString *)minuteDescription;/*精确到分钟的日期描述*/
- (NSString *)formattedTime;
- (NSString *)formattedDateDescription;//格式化日期描述
- (double)timeIntervalSince1970InMilliSecond;
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
+ (NSString *)formattedTimeFromTimeInterval:(long long)time;

+ (NSDate *)dateTomorrow;
+ (NSDate *)dateYesterday;
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *)dateWithDaysBeforeNow:(NSInteger)days;
+ (NSDate *)dateWithHoursFromNow:(NSInteger)dHours;
+ (NSDate *)dateWithHoursBeforeNow:(NSInteger)dHours;
+ (NSDate *)dateWithMinutesFromNow:(NSInteger)dMinutes;
+ (NSDate *)dateWithMinutesBeforeNow:(NSInteger)dMinutes;

- (BOOL)isEqualToDateIgnoringTime:(NSDate *)aDate;
- (BOOL)isToday;
- (BOOL)isTomorrow;
- (BOOL)isYesterday;
- (BOOL)isSameWeekAsDate:(NSDate *)aDate;
- (BOOL)isThisWeek;
- (BOOL)isNextWeek;
- (BOOL)isLastWeek;
- (BOOL)isSameMonthAsDate:(NSDate *)aDate;
- (BOOL)isThisMonth;
- (BOOL)isSameYearAsDate:(NSDate *)aDate;
- (BOOL)isThisYear;
- (BOOL)isNextYear;
- (BOOL)isLastYear;
- (BOOL)isEarlierThanDate:(NSDate *)aDate;
- (BOOL)isLaterThanDate:(NSDate *)aDate;
- (BOOL)isInFuture;
- (BOOL)isInPast;

- (BOOL)isTypicallyWorkday;
- (BOOL)isTypicallyWeekend;

- (NSDate *)dateByAddingDays:(NSInteger)dDays;
- (NSDate *)dateBySubtractingDays:(NSInteger)dDays;
- (NSDate *)dateByAddingHours:(NSInteger)dHours;
- (NSDate *)dateBySubtractingHours:(NSInteger)dHours;
- (NSDate *)dateByAddingMinutes:(NSInteger)dMinutes;
- (NSDate *)dateBySubtractingMinutes:(NSInteger)dMinutes;
- (NSDate *)dateAtStartOfDay;

- (NSInteger)minutesAfterDate:(NSDate *)aDate;
- (NSInteger)minutesBeforeDate:(NSDate *)aDate;
- (NSInteger)hoursAfterDate:(NSDate *)aDate;
- (NSInteger)hoursBeforeDate:(NSDate *)aDate;
- (NSInteger)daysAfterDate:(NSDate *)aDate;
- (NSInteger)daysBeforeDate:(NSDate *)aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;

@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday;
@property (readonly) NSInteger year;

#pragma mark 时间判断

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

@end
