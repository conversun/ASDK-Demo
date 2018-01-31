//
//  NSAttributedString+DE.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (DE)

+ (NSAttributedString *)getAttributedWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor Alignmant:(NSTextAlignment)alignment;
+ (NSAttributedString *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color;
+ (NSAttributedString *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color Alignmant:(NSTextAlignment)alignment;

@end
