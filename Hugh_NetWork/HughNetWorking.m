//
//  HughNetWorking.m
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughNetWorking.h"

/* ------------------------------------------------------------ */
#import "HughNetWorkingTools.h"
/* ------------------------------------------------------------ */

@interface HughNetWorking ()

/* AFHTTPSessionManager 网络请求管理者对象 */
@property (nonatomic, strong) AFHTTPSessionManager *hughSessionManager;

@end

@implementation HughNetWorking

#pragma mark - HughNetworking_Methods
+ (void)hughGET:(NSString *)URLString parameters:(nullable NSDictionary *)parameters hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError {
    HughNetWorking *hughNetworking = [HughNetWorking shareInstance];
    
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    [hughNetworking.hughSessionManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [HughNetWorkingTools hughNetworkingToolsRequestDispose:responseObject];
        hughNetworkingSuccess(task, resultObject);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hughNetworkingError(task, error, [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

+ (void)hughPOST:(NSString *)URLString parameters:(nullable NSDictionary *)parameters hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError {
    HughNetWorking *hughNetworking = [HughNetWorking shareInstance];
    
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    [hughNetworking.hughSessionManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [HughNetWorkingTools hughNetworkingToolsRequestDispose:responseObject];
        hughNetworkingSuccess(task, resultObject);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hughNetworkingError(task, error, [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
}

+ (void)hughPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileData:(NSData *)fileData hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError {
    HughNetWorking *hughNetworking = [HughNetWorking shareInstance];
    
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    [hughNetworking.hughSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:@"picture.png" mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [HughNetWorkingTools hughNetworkingToolsRequestDispose:responseObject];
        hughNetworkingSuccess(task, resultObject);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hughNetworkingError(task, error, [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

+ (void)hughPOSTAddFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileName:(NSString *)fileName fileDatas:(NSArray *)fileDatas hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError {
    HughNetWorking *hughNetworking = [HughNetWorking shareInstance];
    
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    [hughNetworking.hughSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@[%i]", fileName, i];
            [formData appendPartWithFileData:fileDatas[i] name:imageName fileName:imageName mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [HughNetWorkingTools hughNetworkingToolsRequestDispose:responseObject];
        hughNetworkingSuccess(task, resultObject);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hughNetworkingError(task, error, [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

+ (void)hughPOSTAddWithFiles:(NSString *)URLString parameters:(NSDictionary *)parameters fileNames:(NSArray *)fileNames fileDatas:(NSArray *)fileDatas hughNetworkingSuccess:(HughNetworkingSuccess)hughNetworkingSuccess hughNetworkingError:(HughNetworkingError)hughNetworkingError {
    HughNetWorking *hughNetworking = [HughNetWorking shareInstance];
    
    __block NSDictionary *resultObject  = [NSDictionary dictionary];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    [hughNetworking.hughSessionManager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i=0; i<fileDatas.count; i++) {
            [formData appendPartWithFileData:fileDatas[i] name:fileNames[i] fileName:fileNames[i] mimeType:@"image/png"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        resultObject = [HughNetWorkingTools hughNetworkingToolsRequestDispose:responseObject];
        hughNetworkingSuccess(task, resultObject);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        hughNetworkingError(task, error, [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
}

+ (void)hughDownloadFile:(NSString *)URLString hughDownloadProgress:(void(^)(HughDownloadProgress hughDownloadProgress))hughDownloadProgress hughCompletion:(void(^)(NSString *filePath, NSString *fileName,  NSString *error))hughCompletion {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSMutableURLRequest       *request       = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]];
    AFHTTPSessionManager      *manager       = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    
    [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:YES];
    
    NSURLSessionDownloadTask *downloadTask   = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        hughDownloadProgress(HughDownloadProgressMake(downloadProgress.fractionCompleted, downloadProgress.totalUnitCount, downloadProgress.completedUnitCount));
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *pathURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        return [pathURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSString *downloadFilePath = [HughNetWorkingTools hughNetworkingToolsDownloadFilePath:filePath];
        if (error) [[NSFileManager defaultManager] removeItemAtPath:downloadFilePath error:nil];
        hughCompletion(downloadFilePath, [HughNetWorkingTools hughNetworkingToolsGetDownloadFileName:filePath], [HughNetWorkingTools hughNetworkingToolsGetErrorMessage:error]);
        [HughNetWorkingTools hughNetworkingToolsSetNetworkActivityIndicatorVisible:NO];
    }];
    
    [downloadTask resume];
}

+ (void)hughNetworkingReachabilityStatusChangeBlock:(void(^)(HughNetworkingReachabilityStatus hughNetworkingStatus))hughNetworkingStatus {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                hughNetworkingStatus(HughNetworkingReachabilityStatusUnknown);
                break;
            case AFNetworkReachabilityStatusNotReachable:
                hughNetworkingStatus(HughNetworkingReachabilityStatusNotReachable);
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                hughNetworkingStatus(HughNetworkingReachabilityStatusReachableViaWWAN);
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                hughNetworkingStatus(HughNetworkingReachabilityStatusReachableViaWiFi);
                break;
            default:
                break;
        }
    }];
}

#pragma mark - Init_HughNetworking
+ (instancetype)shareInstance {
    static HughNetWorking *hughNetworking = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        hughNetworking = [[self alloc] init];
    });
    
    return hughNetworking;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

#pragma Init_AFHTTPSessionManager
- (AFHTTPSessionManager *)hughSessionManager {
    if (!_hughSessionManager) {
        _hughSessionManager = [AFHTTPSessionManager manager];
        _hughSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [_hughSessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/html", @"text/css", @"text/javascript", nil]];//设置响应的Content-Type格式
        _hughSessionManager.requestSerializer = [AFJSONRequestSerializer new];
        [_hughSessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; //设置请求的Content-Type格式
    }
    
    return _hughSessionManager;
}

@end
