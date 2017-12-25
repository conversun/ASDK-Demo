//
//  NSAttributedString+DE.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "NSAttributedString+DE.h"

@implementation NSAttributedString (DE)

+ (NSAttributedString *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color{
    NSDictionary *dict = @{
                           NSFontAttributeName: font,
                           NSForegroundColorAttributeName: color,
                           
                           };
    return [[NSAttributedString alloc] initWithString:text attributes:dict];
    
}
@end
