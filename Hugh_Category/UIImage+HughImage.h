//
//  UIImage+HughImage.h
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIImage (HughImage)

/**
 根据URL生成指定大小的二维码图片

 @param urlStr t链接地址
 @return 二维码图片
 */
+ (UIImage *)hugh_generateCodesAccordingToURL:(NSString *)urlStr withSize:(CGFloat)size;

/**
 图片合成
 */
+ (UIImage *)hugh_imageSynthesisImage:(UIImage *)underlyingImage watermarkImage:(UIImage *)watermarkImage withFrame:(CGRect)frame;

@end


