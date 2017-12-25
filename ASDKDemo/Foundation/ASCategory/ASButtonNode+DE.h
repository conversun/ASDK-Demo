//
//  ASButtonNode+DE.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASButtonNode (DE)

+ (ASButtonNode *)createWithImage:(UIImage *)img;
+ (ASButtonNode *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color;
+ (ASButtonNode *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color Image:(UIImage *)img Spacing:(CGFloat)spacing;

@end
