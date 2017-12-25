//
//  ASNetworkImageNode+DE.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "ASNetworkImageNode+DE.h"

@implementation ASNetworkImageNode (DE)

+ (ASNetworkImageNode *)createWithURLStr:(NSString *)urlStr{
    ASNetworkImageNode *imageNode = [[ASNetworkImageNode alloc] init];
    imageNode.URL = [NSURL URLWithString:urlStr];
    imageNode.clipsToBounds = YES;
    imageNode.placeholderFadeDuration = 0.5;
    imageNode.placeholderEnabled = YES;
    imageNode.contentMode = UIViewContentModeScaleAspectFill;
    return imageNode;
    
}

@end
