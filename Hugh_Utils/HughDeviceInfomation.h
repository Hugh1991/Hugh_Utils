//
//  HughDeviceInfomation.h
//
//  Created by Hugh on 18/10/25.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HughDeviceInfomation : NSObject

/**
 获取APP版本号
 
 @return 返回APP版本号
 */
+ (NSString *)acquireBundleShortVersion;

/**
 获取APP BundleId
 
 @return 返回APP BundleId
 */
+ (NSString *)acquireBundleIdentifier;

/**
 获取设备 IDFA
 
 @return 返回设备IDFA
 */
+ (NSString *)acquireAdvertisingIdentifier;

/**
 系统版本
 
 @return 系统版本号
 */
+ (NSString *)acquireDeviceSystemVersion;

/**
 获取UUID
 
 @return 手机UUID
 */
+ (NSString *)getUUID;

/**
 判断iPhone是否是iPhone X系列

 @return 判断结果
 */
- (BOOL)hugh_isIphoneX;

/**
 获取设备IP地址   ps:模拟器无法获取IP地址
 
 @return IP地址
 */
+ (NSString *)getDeviceIPAddress;

/**
 获取SIM信息
 
 @return SIM信息
 */
+ (NSDictionary *)getDeviceSimInfo;

/**
 判断当前运行环境
 
 @return 返回模拟器||真机
 */
+ (BOOL)detectionSimulatorsOrPhone;

/**
 设备VPN检测
 
 @return 返回VPN结果
 */
+ (BOOL)detectionVPingConnet;

/**
 检测是否开启了代理
 
 @return 返回代理结果
 */
+ (BOOL)detectionNetworkPrxy;

/**
 判断当前设备是否越狱
 
 @return 返回检测结果
 */
+ (BOOL)deviceIsBreak;

@end

