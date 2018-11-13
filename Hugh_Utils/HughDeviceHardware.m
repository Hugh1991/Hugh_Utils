//
//  HughDeviceHardware.m
//
//  Created by Hugh on 18/10/25.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

#define DH_MACHINE_IPHONE_1_1 @"iPhone1,1"
#define DH_MACHINE_IPHONE_1_2 @"iPhone1,2"
#define DH_MACHINE_IPHONE_2_1 @"iPhone2,1"
#define DH_MACHINE_IPHONE_3_1 @"iPhone3,1"
#define DH_MACHINE_IPHONE_3_3 @"iPhone3,3"
#define DH_MACHINE_IPHONE_4_1 @"iPhone4,1"
#define DH_MACHINE_IPHONE_5_1 @"iPhone5,1"
#define DH_MACHINE_IPHONE_5_2 @"iPhone5,2"
#define DH_MACHINE_IPHONE_5_3 @"iPhone5,3"
#define DH_MACHINE_IPHONE_5_4 @"iPhone5,4"
#define DH_MACHINE_IPHONE_6_1 @"iPhone6,1"
#define DH_MACHINE_IPHONE_6_2 @"iPhone6,2"
#define DH_MACHINE_IPHONE_7_1 @"iPhone7,1"
#define DH_MACHINE_IPHONE_7_2 @"iPhone7,2"
#define DH_MACHINE_IPHONE_8_1 @"iPhone8,1"
#define DH_MACHINE_IPHONE_8_2 @"iPhone8,2"
#define DH_MACHINE_IPHONE_8_4 @"iPhone8,4"
#define DH_MACHINE_IPHONE_9_1 @"iPhone9,1"
#define DH_MACHINE_IPHONE_9_2 @"iPhone9,2"
#define DH_MACHINE_IPHONE_9_3 @"iPhone9,3"
#define DH_MACHINE_IPHONE_9_4 @"iPhone9,4"
#define DH_MACHINE_IPHONE_10_1 @"iPhone10,1"
#define DH_MACHINE_IPHONE_10_2 @"iPhone10,2"
#define DH_MACHINE_IPHONE_10_3 @"iPhone10,3"
#define DH_MACHINE_IPHONE_10_4 @"iPhone10,4"
#define DH_MACHINE_IPHONE_10_5 @"iPhone10,5"
#define DH_MACHINE_IPHONE_10_6 @"iPhone10,6"
#define DH_MACHINE_IPHONE_11_2 @"iPhone11,2"
#define DH_MACHINE_IPHONE_11_4 @"iPhone11,4"
#define DH_MACHINE_IPHONE_11_6 @"iPhone11,6"
#define DH_MACHINE_IPHONE_11_8 @"iPhone11,8"

#define DH_MACHINE_I386   @"i386"
#define DH_MACHINE_X86_64 @"x86_64"

@implementation HughDeviceHardware

+ (HughDeviceHardwareGeneralPlatform)generalPlatform {
    NSString *platform = [self machine];
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return HughDeviceHardwareGeneralPlatform_iPhone_1G;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return HughDeviceHardwareGeneralPlatform_iPhone_3G;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return HughDeviceHardwareGeneralPlatform_iPhone_3GS;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return HughDeviceHardwareGeneralPlatform_iPhone_4;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return HughDeviceHardwareGeneralPlatform_iPhone_4;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return HughDeviceHardwareGeneralPlatform_iPhone_4S;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return HughDeviceHardwareGeneralPlatform_iPhone_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return HughDeviceHardwareGeneralPlatform_iPhone_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return HughDeviceHardwareGeneralPlatform_iPhone_5C;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return HughDeviceHardwareGeneralPlatform_iPhone_5C;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return HughDeviceHardwareGeneralPlatform_iPhone_5S;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return HughDeviceHardwareGeneralPlatform_iPhone_5S;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return HughDeviceHardwareGeneralPlatform_iPhone_6_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return HughDeviceHardwareGeneralPlatform_iPhone_6;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return HughDeviceHardwareGeneralPlatform_iPhone_6S;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return HughDeviceHardwareGeneralPlatform_iPhone_6S_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return HughDeviceHardwareGeneralPlatform_iPhone_SE;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return HughDeviceHardwareGeneralPlatform_iPhone_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return HughDeviceHardwareGeneralPlatform_iPhone_7_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return HughDeviceHardwareGeneralPlatform_iPhone_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return HughDeviceHardwareGeneralPlatform_iPhone_7_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_1])   return HughDeviceHardwareGeneralPlatform_iPhone_8;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_2])   return HughDeviceHardwareGeneralPlatform_iPhone_8_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_3])   return HughDeviceHardwareGeneralPlatform_iPhone_X;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_4])   return HughDeviceHardwareGeneralPlatform_iPhone_8;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_5])   return HughDeviceHardwareGeneralPlatform_iPhone_8_Plus;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_6])   return HughDeviceHardwareGeneralPlatform_iPhone_X;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_2])   return HughDeviceHardwareGeneralPlatform_iPhone_XS;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_4])   return HughDeviceHardwareGeneralPlatform_iPhone_XS_MAX;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_6])   return HughDeviceHardwareGeneralPlatform_iPhone_XS_MAX;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_8])   return HughDeviceHardwareGeneralPlatform_iPhone_XR;
    if ([platform isEqualToString:DH_MACHINE_I386])          return HughDeviceHardwareGeneralPlatform_Simulator;
    if ([platform isEqualToString:DH_MACHINE_X86_64])        return HughDeviceHardwareGeneralPlatform_Simulator;
    
    return HughDeviceHardwareGeneralPlatform_Unknown;
}

+ (IPhoneInchType)screenSizeType {
    NSString *platform = [self machine];
    
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return IPhoneInchType_3_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return IPhoneInchType_4_0;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_1])   return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_4])   return IPhoneInchType_4_7;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_2])   return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_5])   return IPhoneInchType_5_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_3])   return IPhoneInchType_5_8;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_6])   return IPhoneInchType_5_8;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_2])   return IPhoneInchType_5_8;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_4])   return IPhoneInchType_6_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_6])   return IPhoneInchType_6_5;
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_8])   return IPhoneInchType_6_1;
    if ([platform isEqualToString:DH_MACHINE_I386])          return IPhoneInchType_Simulator;
    if ([platform isEqualToString:DH_MACHINE_X86_64])        return IPhoneInchType_Simulator;
    
    return IPhoneInchType_Unkown;
}

+ (NSString *)platformString {
    NSString *platform = [self machine];
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_1])    return @"iPhone 1G";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_1_2])    return @"iPhone 3G";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_2_1])    return @"iPhone 3GS";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_1])    return @"iPhone 4";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_3_3])    return @"iPhone 4";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_4_1])    return @"iPhone 4S";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_1])    return @"iPhone 5";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_2])    return @"iPhone 5";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_3])    return @"iPhone 5C";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_5_4])    return @"iPhone 5C";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_1])    return @"iPhone 5S";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_6_2])    return @"iPhone 5S";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_1])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_7_2])    return @"iPhone 6";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_1])    return @"iPhone 6S";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_2])    return @"iPhone 6S Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_8_4])    return @"iPhone SE";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_1])    return @"iPhone 7";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_2])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_3])    return @"iPhone 7";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_9_4])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_1])   return @"iPhone 8";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_4])   return @"iPhone 8";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_2])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_5])   return @"iPhone 8 Plus";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_3])   return @"iPhone X";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_10_6])   return @"iPhone X";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_2])   return @"iPhone XS";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_4])   return @"iPhone XS MAX";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_6])   return @"iPhone XS MAX";
    if ([platform isEqualToString:DH_MACHINE_IPHONE_11_8])   return @"iPhone XR";
    if ([platform isEqualToString:DH_MACHINE_I386])          return @"Simulator";
    if ([platform isEqualToString:DH_MACHINE_X86_64])        return @"Simulator";
    
    return platform;
}

+ (NSString *)machine {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);  
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

@end

