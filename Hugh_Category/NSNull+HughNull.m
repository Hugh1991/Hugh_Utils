//
//  NSNull+HughNull.m
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "NSNull+HughNull.h"

@implementation NSNull (HughNull)

- (id)objectForKeySafely:(id)aKey {
    NSLog(@"NSDictionary warning:nsdictionary为NSNull key=%@", aKey);
    return nil;
}

@end
