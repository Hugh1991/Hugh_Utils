//
//  HughNetWorkingTools.m
//
//  Created by Hugh on 2018/10/29.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "HughNetWorkingTools.h"

@implementation HughNetWorkingTools

+ (NSString *)hughNetworkingToolsDownloadFilePath:(NSURL *)filePath {
    return [NSString stringWithFormat:@"%@/%@", [HughNetWorkingTools hughNetworkingToolsGetDocumentsPath], [HughNetWorkingTools hughNetworkingToolsGetDownloadFileName:filePath]];
}


+ (NSString *)hughNetworkingToolsGetDownloadFileName:(NSURL *)filePath {
    NSString *filePathString = [NSString stringWithFormat:@"%@", filePath];
    return [filePathString componentsSeparatedByString:@"/"].lastObject;
}


+ (NSString *)hughNetworkingToolsGetDocumentsPath {
    NSArray  *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPaths = [paths objectAtIndex:0];
    return documentsPaths;
}


+ (void)hughNetworkingToolsSetNetworkActivityIndicatorVisible:(BOOL)networkActivityIndicatorVisible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = networkActivityIndicatorVisible;
}


+ (NSString *)hughNetworkingToolsGetErrorMessage:(NSError *)error {
    return error == nil ? nil : [NSString stringWithFormat:@"错误代码%ld \n 错误信息%@", (long)error.code, error.localizedDescription];
}


+ (NSDictionary *)hughNetworkingToolsRequestDispose:(id)responseObject {
    NSString *decodeJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    
    if (!decodeJson)
        return nil;
    
    NSData *data = [decodeJson dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return dictionary;
}

@end
