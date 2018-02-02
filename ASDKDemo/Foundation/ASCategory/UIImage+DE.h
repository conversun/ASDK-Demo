//
//  UIImage+DE.h
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DE)

/**
 图片裁剪圆角

 @param radius 圆角
 @param size 图片大小, 未计算 ScreenScale
 @return UIImage
 */
- (UIImage *)makeCornerRadius:(CGFloat)radius Size:(CGSize)size;

@end
