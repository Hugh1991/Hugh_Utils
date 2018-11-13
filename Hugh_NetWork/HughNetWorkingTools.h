//
//  HughNetWorkingTools.h
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HughNetWorkingTools : NSObject

/**
 *  下载 文件 路径处理
 *
 *  @return NSString
 */
+ (NSString *)hughNetworkingToolsDownloadFilePath:(NSURL *)filePath;

/**
 *  取出下载文件名称
 *
 *  @return NSString
 */
+ (NSString *)hughNetworkingToolsGetDownloadFileName:(NSURL *)filePath;

/**
 *  显示或隐藏网络获取数据时UINavigationBar上的菊花图标
 */

+ (void)hughNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible;

/**
 *  获取错误信息
 *
 *  @return NSString
 */
+ (NSString *)hughNetworkingToolsGetErrorMessage:(NSError *)error;

/**
 *  返回网络结果集处理
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)hughNetworkingToolsRequestDispose:(id)responseObject;

@end


