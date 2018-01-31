//
//  ASTextNode+DE.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "ASTextNode+DE.h"

@implementation ASTextNode (DE)

+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr{
    return [self createWithAttr:attr LineCount:0];
    
}

+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr LineCount:(NSInteger)lineCount{
    ASTextNode *textNode = [ASTextNode new];
    textNode.attributedText = attr;
    textNode.placeholderEnabled = YES;
    textNode.placeholderFadeDuration = 0.2;
    textNode.placeholderColor = [UIColor colorWithWhite:0.777 alpha:1.0];
    textNode.maximumNumberOfLines = lineCount;
    textNode.truncationMode = NSLineBreakByTruncatingTail;
    return textNode;
    
}

@end
