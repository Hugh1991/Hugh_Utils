//
//  HughKeyChainStore.h
//
//  Created by Hugh on 18/10/25.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  KEY_USERNAME_PASSWORD  @"com.xiaoniu.integral.usernamepassword"
#define  KEY_USERNAME           @"com.xiaoniu.integral.username"
#define  KEY_PASSWORD           @"com.xiaoniu.integral.password"


@interface HughKeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end


