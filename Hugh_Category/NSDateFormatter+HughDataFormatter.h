//
//  NSDateFormatter+HughDataFormatter.h
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (HughDataFormatter)

+ (id)dateFormatter;
+ (id)dateFormatterWithFormat:(NSString *)dateFormat;

+ (id)defaultDateFormatter;/*yyyy-MM-dd HH:mm:ss*/

@end
