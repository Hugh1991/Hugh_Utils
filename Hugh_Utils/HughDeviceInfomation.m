//
//  HughDeviceInfomation.m
//
//  Created by Hugh on 18/10/25.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughDeviceInfomation.h"
#import <AdSupport/ASIdentifierManager.h>
#import  <CoreTelephony/CTTelephonyNetworkInfo.h>
#import  <CoreTelephony/CTCarrier.h>
#import "HughDeviceHardware.h"
#import "HughKeyChainStore.h"

/*-------------------- 设备IP地址 --------------------*/
#import <ifaddrs.h>
#import <arpa/inet.h>
/*--------------------------------------------------*/

@implementation HughDeviceInfomation

+ (NSString *)acquireBundleShortVersion {
    NSString *englishVer = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return englishVer;
}

+ (NSString *)acquireBundleIdentifier {
    NSString *excleBundWaveStr = [[NSBundle mainBundle] bundleIdentifier];
    return excleBundWaveStr;
}

+ (NSString *)acquireAdvertisingIdentifier{
    SEL advertisingIdentifierSel = sel_registerName("advertisingIdentifier");
    SEL UUIDStringSel = sel_registerName("UUIDString");
    
    ASIdentifierManager *manager = [ASIdentifierManager sharedManager];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if([manager respondsToSelector:advertisingIdentifierSel]) {
        
        id UUID = [manager performSelector:advertisingIdentifierSel];
        
        if([UUID respondsToSelector:UUIDStringSel]) {
            
            return [UUID performSelector:UUIDStringSel];
            
        }
        
    }
#pragma clang diagnostic pop
    return nil;
}

+ (NSString *)acquireDeviceSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)getUUID {
    NSString * strUUID = (NSString *)[HughKeyChainStore load:KEY_USERNAME_PASSWORD];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID){
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault,uuidRef));
        
        [HughKeyChainStore save:KEY_USERNAME_PASSWORD data:strUUID];
    }
    
    return strUUID;
}

- (BOOL)hugh_isIphoneX {
    BOOL isIphoneX = NO;

    switch ([HughDeviceHardware generalPlatform]) {
        case HughDeviceHardwareGeneralPlatform_iPhone_X: {
            isIphoneX = YES;
        }
            break;

        case HughDeviceHardwareGeneralPlatform_iPhone_XR: {
            isIphoneX = YES;
        }
            break;

        case HughDeviceHardwareGeneralPlatform_iPhone_XS: {
            isIphoneX = YES;
        }
            break;

        case HughDeviceHardwareGeneralPlatform_iPhone_XS_MAX: {
            isIphoneX = YES;
        }
            break;

        default:
            break;
    }

    return isIphoneX;
}

+ (NSString *)getDeviceIPAddress {
    NSString *address = @"No IP Address";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);
    return address;
}

+ (NSDictionary *)getDeviceSimInfo {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    NSString *name = [carrier carrierName];         //供应商信息
    NSString *mcc = [carrier mobileCountryCode];    //国家编码
    NSString *mnc = [carrier mobileNetworkCode];    //服务商编码
    NSString *isoCode = [carrier isoCountryCode];   //服务商iso国家编码
    BOOL voip = [carrier allowsVOIP];               //是否允许voip通话
    
    NSDictionary *imsiDic = @{@"name": name == nil ? @"" : name,
                              @"mcc": mcc == nil ? @"" : mcc,
                              @"mnc": mnc == nil ? @"" : mnc,
                              @"isoCode": isoCode == nil ? @"" : isoCode,
                              @"voip": [NSNumber numberWithBool:voip]};
    
    return imsiDic;
}

+ (BOOL)detectionSimulatorsOrPhone {
    if (TARGET_IPHONE_SIMULATOR) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)detectionVPingConnet {
    NSDictionary *dictVPCon = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    
    NSArray *keysNetCon = [dictVPCon[@"__SCOPED__"]allKeys];
    
    for (NSString *keyConNet in keysNetCon) {
        if ([keyConNet rangeOfString:@"tap"].location != NSNotFound ||
            [keyConNet rangeOfString:@"tun"].location != NSNotFound ||
            [keyConNet rangeOfString:@"ppp"].location != NSNotFound){
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)detectionNetworkPrxy {
    NSDictionary *effrctCreat = (__bridge NSDictionary *)(CFNetworkCopySystemProxySettings());
    
    NSArray *effectArray = (__bridge NSArray *)(CFNetworkCopyProxiesForURL((__bridge CFURLRef _Nonnull)([NSURL URLWithString:@"https://www.baidu.com"]), (__bridge CFDictionaryRef _Nonnull)(effrctCreat)));
    
    NSDictionary *efficDic = effectArray[0];
    
    if ([[efficDic objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:@"kCFProxyTypeNone"]) {
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)deviceIsBreak {
    // 检查是否存在越狱常用文件
    NSArray *jailFilePaths = @[@"/Applications/Cydia.app",
                               @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                               @"/bin/bash",
                               @"/usr/sbin/sshd",
                               @"/etc/apt"];
    for (NSString *filePath in jailFilePaths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            return YES;
        }
    }
    
    // 检查是否安装了越狱工具Cydia
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]){
        return YES;
    }
    
    // 检查是否有权限读取系统应用列表
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Applications/"]){
        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/User/Applications/"
                                                                               error:nil];
        NSLog(@"applist = %@",applist);
        return YES;
    }
    
    //  检测当前程序运行的环境变量
    char *env = getenv("DYLD_INSERT_LIBRARIES");
    if (env != NULL) {
        return YES;
    }
    
    return NO;
}

@end
