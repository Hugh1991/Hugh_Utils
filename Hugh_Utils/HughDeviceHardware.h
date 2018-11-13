//
//  HughDeviceHardware.h
//
//  Created by Hugh on 18/10/25.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    HughDeviceHardwareGeneralPlatform_Unknown,
    HughDeviceHardwareGeneralPlatform_iPhone_1G,
    HughDeviceHardwareGeneralPlatform_iPhone_3G,
    HughDeviceHardwareGeneralPlatform_iPhone_3GS,
    HughDeviceHardwareGeneralPlatform_iPhone_4,
    HughDeviceHardwareGeneralPlatform_iPhone_4S,
    HughDeviceHardwareGeneralPlatform_iPhone_5,
    HughDeviceHardwareGeneralPlatform_iPhone_5C,
    HughDeviceHardwareGeneralPlatform_iPhone_5S,
    HughDeviceHardwareGeneralPlatform_iPhone_SE,
    HughDeviceHardwareGeneralPlatform_iPhone_6,
    HughDeviceHardwareGeneralPlatform_iPhone_6_Plus,
    HughDeviceHardwareGeneralPlatform_iPhone_6S,
    HughDeviceHardwareGeneralPlatform_iPhone_6S_Plus,
    HughDeviceHardwareGeneralPlatform_iPhone_7,
    HughDeviceHardwareGeneralPlatform_iPhone_7_Plus,
    HughDeviceHardwareGeneralPlatform_iPhone_8,
    HughDeviceHardwareGeneralPlatform_iPhone_8_Plus,
    HughDeviceHardwareGeneralPlatform_iPhone_X,
    HughDeviceHardwareGeneralPlatform_iPhone_XR,
    HughDeviceHardwareGeneralPlatform_iPhone_XS,
    HughDeviceHardwareGeneralPlatform_iPhone_XS_MAX,
    HughDeviceHardwareGeneralPlatform_Simulator
} HughDeviceHardwareGeneralPlatform;

typedef enum {
    HughDeviceHardwarePlatformType_Unknown,
    HughDeviceHardwarePlatformType_iPhone,
    HughDeviceHardwarePlatformType_Simulator
} HughDeviceHardwarePlatformType;

typedef enum {
    IPhoneInchType_Unkown,
    IPhoneInchType_3_5,
    IPhoneInchType_4_0,
    IPhoneInchType_4_7,
    IPhoneInchType_5_5,
    IPhoneInchType_5_8,
    IPhoneInchType_6_1,
    IPhoneInchType_6_5,
    IPhoneInchType_Simulator
} IPhoneInchType;

@interface HughDeviceHardware : NSObject

/**
 手机类型

 @return 类型
 */
+ (HughDeviceHardwareGeneralPlatform)generalPlatform;

/**
 屏幕尺寸

 @return 返回屏幕尺寸
 */
+ (IPhoneInchType)screenSizeType;

/**
 手机型号

 @return 型号
 */
+ (NSString *)platformString;

+ (NSString *)machine;

@end
