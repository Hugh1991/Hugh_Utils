//
//  HughNetWorking.h
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <Foundation/Foundation.h>

/* ----------------------      Tool      ---------------------- */
#import "HughNetworkingVariableType.h"      // 自定义参数
/* ------------------------------------------------------------ */


@interface HughNetWorking : NSObject

/**
 *  请求网络获取数据 <POST>
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  hughNetworkingSuccess           请求获取数据成功
 *
 *  @param  hughNetworkingError             请求获取数据失败
 */
+ (void)hughGET:(NSString *)URLString parameters:(nullable NSDictionary *)parameters hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError;

/**
 *  请求网络获取数据 <POST>
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  hughNetworkingSuccess           请求获取数据成功
 *
 *  @param  hughNetworkingError             请求获取数据失败
 */
+ (void)hughPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError;

/**
 *  请求网络获上传文件 单文件上传 <POST>
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  fileName                        请求 上传文件的名称
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  hughNetworkingSuccess           请求获取数据成功
 *
 *  @param  hughNetworkingError             请求获取数据失败
 */
+ (void)hughPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError;

/**
 *  请求网络上传文件 多文件上传, 文件名称相同使用该方法 <POST>
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  fileName                        请求 上传文件的名称
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  hughNetworkingSuccess           请求获取数据成功
 *
 *  @param  hughNetworkingError             请求获取数据失败
 */
+ (void)hughPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError;

/**
 *  请求网络上传文件 多文件上传, 文件名称不相同相同使用该方法  <POST>
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数          ( 可以传 nil )
 *
 *  @param  fileNames                       请求 上传文件的名称数组      ( 和后台一致 )
 *
 *  @param  fileDatas                       请求 上传文件的流数组
 *
 *  @param  hughNetworkingSuccess           请求获取数据成功
 *
 *  @param  hughNetworkingError             请求获取数据失败
 */
+ (void)hughPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError;

/**
 *  请求网络 < 下载图片方法 >
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  hughDownloadProgress            下载进度
 *
 *  @param  hughCompletion                  下载回调
 */
+ (void)hughDownloadFile:(NSString *)URLString hughDownloadProgress:(void(^)(HughDownloadProgress hughDownloadProgress))hughDownloadProgress hughCompletion:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))hughCompletion;

/**
 *  验证网络环境
 *
 *  @param  hughResultStatus                网络状态
 */
+ (void)hughNetworkingReachabilityStatusChangeBlock:(void(^)(HughNetworkingReachabilityStatus hughResultStatus))hughResultStatus;


@end


