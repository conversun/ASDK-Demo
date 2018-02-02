//
//  UIImage+DE.m
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "UIImage+DE.h"

@implementation UIImage (DE)

- (UIImage *)makeCornerRadius:(CGFloat)radius Size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    UIBezierPath *path = [UIBezierPath
                          bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                          cornerRadius:radius * [UIScreen mainScreen].scale];
    [path addClip];
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *refinedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return refinedImg;
    
}

@end
