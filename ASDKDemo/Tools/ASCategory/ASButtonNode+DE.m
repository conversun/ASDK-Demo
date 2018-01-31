//
//  ASButtonNode+DE.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "ASButtonNode+DE.h"

@implementation ASButtonNode (DE)

+ (ASButtonNode *)createWithImage:(UIImage *)img{
    return [self createWithText:nil Font:nil Color:nil Image:img Spacing:0];
    
}

+ (ASButtonNode *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color{
    return [self createWithText:text Font:font Color:color Image:nil Spacing:0];
    
}

+ (ASButtonNode *)createWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color Image:(UIImage *)img Spacing:(CGFloat)spacing{
    
    ASButtonNode *buttonNode = [[ASButtonNode alloc]init];
    
    if (text.length) {
        [buttonNode setTitle:text withFont:font withColor:color forState:UIControlStateNormal];
        
    }
    
    if (img) {
        [buttonNode setImage:img forState:UIControlStateNormal];
        [buttonNode setContentSpacing:spacing];
        
    }
    return buttonNode;
    
}

@end
