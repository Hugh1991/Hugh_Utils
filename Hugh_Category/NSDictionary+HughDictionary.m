//
//  NSDictionary+HughDictionary.m
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "NSDictionary+HughDictionary.h"

@implementation NSDictionary (HughDictionary)

//处理json含有null的情况
- (id)objectForKeySafely:(id)aKey {
    if(self == nil || self == (id)[NSNull null]) {
        NSLog(@"NSDictionary warning:nsdictionary为nil");
        return nil;
    }
    
    id value = [self objectForKey:aKey];
    if (value == nil || value == (id)[NSNull null]) {
        if(value == (id)[NSNull null]) NSLog(@"NSDictionary warning:(key=%@,value=NSNull)", aKey);
        return nil;
    } else
        return value;
}


@end
