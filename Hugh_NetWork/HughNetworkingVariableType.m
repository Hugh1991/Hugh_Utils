//
//  HughNetworkingVariableType.m
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughNetworkingVariableType.h"

@implementation HughNetworkingVariableType

HughDownloadProgress HughDownloadProgressMake(double hughFractionCompleted, hugh_int64_t hughTotalUnitCount, hugh_int64_t hughCompletedUnitCount) {
    HughDownloadProgress hughDownloadProgress;
    hughDownloadProgress.hughFractionCompleted  = hughFractionCompleted;
    hughDownloadProgress.hughTotalUnitCount     = hughTotalUnitCount;
    hughDownloadProgress.hughCompletedUnitCount = hughCompletedUnitCount;
    
    return hughDownloadProgress;
}


@end
