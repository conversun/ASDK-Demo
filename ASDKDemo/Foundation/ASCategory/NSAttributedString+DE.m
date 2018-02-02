//
//  NSAttributedString+DE.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "NSAttributedString+DE.h"

@implementation NSAttributedString (DE)

+ (NSAttributedString *)getAttributedWithText:(NSString *)text Font:(UIFont *)font TextColor:(UIColor *)textColor Alignmant:(NSTextAlignment)alignment{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, [text length])];
    [attributedString addAttribute:NSForegroundColorAttributeName value:textColor range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    [paragraphStyle setAlignment:alignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    return attributedString;
    
}

+ (NSAttributedString *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color{
    return [self createWithText:text Font:font Color:color Alignmant:NSTextAlignmentLeft];
    
}

+ (NSAttributedString *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color Alignmant:(NSTextAlignment)alignment{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.alignment = alignment;
//    style.lineSpacing = 6;
    NSDictionary *descriptionAttributes = @{NSFontAttributeName: font,
                                            NSForegroundColorAttributeName: color,
                                            NSParagraphStyleAttributeName:style
                                            };
    return [[NSAttributedString alloc] initWithString:text attributes:descriptionAttributes];
}


@end
