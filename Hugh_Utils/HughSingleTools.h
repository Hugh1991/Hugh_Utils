//
//  HughSingleTools.h
//
//  Created by Hugh on 18/6/8.
//  Copyright © 2016年 Hugh. All rights reserved.
//


/* --- 单例 - 宏 --- */

/* --- MRC和ARC版本通用判断方法 --- */

/*
 #if !__has_feature(objc_arc)
 - (oneway void)release {}
 - (id)retain { return _instance; }
 - (id)autorelease { return _instance; }
 - (NSUInteger)retainCount { return UINT_MAX; }
 #endif
 */

/* --- 头文件shared类方法声明 --- */
#define    singletonInterface(className)   +(instancetype)shared##className;

/* --- 单例需要实现的三个方法 --- */
#define    singletonImplementation(className)   \
static className *_instance;    \
+ (instancetype)shared##className{   \
    static dispatch_once_t onceToken;   \
    dispatch_once(&onceToken, ^{    \
        _instance = [[self alloc] init];    \
    }); \
    \
    return _instance;   \
}   \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone {   \
    static dispatch_once_t onceToken;   \
    dispatch_once(&onceToken, ^{    \
        _instance = [super allocWithZone:zone]; \
    }); \
    \
    return _instance;   \
}   \
\
- (id)copyWithZone:(NSZone *)zone {   \
    return _instance;   \
}
