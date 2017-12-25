//
//  ASTextNode+DE.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASTextNode (DE)

+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr;
+ (ASTextNode *)createWithAttr:(NSAttributedString *)attr LineCount:(NSInteger)lineCount;

@end
