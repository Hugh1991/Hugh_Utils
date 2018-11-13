//
//  NSDateFormatter+HughDataFormatter.m
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "NSDateFormatter+HughDataFormatter.h"

@implementation NSDateFormatter (HughDataFormatter)

+ (id)dateFormatter {
    return [[self alloc] init];
}

+ (id)dateFormatterWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[self alloc] init];
    dateFormatter.dateFormat = dateFormat;
    return dateFormatter;
}

+ (id)defaultDateFormatter {
    return [self dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss"];
}

@end
