//
//  UIImage+HughImage.h
//
//  Created by Hugh on 2018/10/28.
//  Copyright © 2018年 Hugh. All rights reserved.
//

#import "UIImage+HughImage.h"

@implementation UIImage (HughImage)

+ (UIImage *)hugh_generateCodesAccordingToURL:(NSString *)urlStr withSize:(CGFloat)size {
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    NSData *data = [urlStr dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *outputImage = [filter outputImage];
    
    return [self createNonInterpolatedUIImageFormCIImage:outputImage withSize:size];//重绘二维码,使其显示清晰
}

/**
 图片合成
 */
+ (UIImage *)hugh_imageSynthesisImage:(UIImage *)underlyingImage watermarkImage:(UIImage *)watermarkImage withFrame:(CGRect)frame {
    UIGraphicsBeginImageContextWithOptions(underlyingImage.size ,NO, 0.0);
    [underlyingImage drawInRect:CGRectMake(0, 0, underlyingImage.size.width, underlyingImage.size.height)];
    
    //水印图片的位置
    [watermarkImage drawInRect:frame];

    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultingImage;
}

#pragma mark - Private
/**
 根据CIImage生成指定大小的UIImage
 */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

@end
