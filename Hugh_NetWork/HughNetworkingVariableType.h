//
//  HughNetworkingVariableType.h
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HughNetworkingVariableType : NSObject

typedef long long hugh_int64_t;

/* HughNetworking 的请求成功 回调 */
typedef void(^HughNetworkingSuccess)(NSURLSessionDataTask *task, id resultObject);
/* HughNetworking 的请求失败 回调 */
typedef void(^HughNetworkingError)(NSURLSessionDataTask *task, NSError *error, NSString *errorMessage);


/* 下载进度 结构体 */
struct HughDownloadProgress {
    double       hughFractionCompleted;
    hugh_int64_t hughTotalUnitCount;
    hugh_int64_t hughCompletedUnitCount;
};

typedef struct HughDownloadProgress HughDownloadProgress;

/**
 *
 *  @brief  HughDownloadProgress 快速初始化下载进度的结构体
 *
 *  @return HughDownloadProgress
 */
HughDownloadProgress HughDownloadProgressMake(double hughFractionCompleted, hugh_int64_t hughTotalUnitCount, hugh_int64_t hughCompletedUnitCount);


/* 网络状态 */
typedef NS_ENUM(NSInteger, HughNetworkingReachabilityStatus) {
    HughNetworkingReachabilityStatusUnknown          = -1,   /* 未知网络 */
    HughNetworkingReachabilityStatusNotReachable     = 0,    /* 无网络   */
    HughNetworkingReachabilityStatusReachableViaWWAN = 1,    /* WWAN    */
    HughNetworkingReachabilityStatusReachableViaWiFi = 2,    /* WiFi    */
};

@end


