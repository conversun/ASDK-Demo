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
    imageNode.placeholderFadeDuration = 0.2;
    imageNode.placeholderEnabled = YES;
    imageNode.contentMode = UIViewContentModeScaleAspectFill;
    return imageNode;
    
}

- (asimagenode_modification_block_t )imageMaskScreenBlock{
    return [self imageModBlockWithCorner:8 MaskImage:[UIImage imageNamed:@"mask_smallscreen"]];
    
}

- (asimagenode_modification_block_t )imageModBlockWithCorner:(CGFloat )corner{
    return [self imageModBlockWithCorner:8 MaskImage:nil];
    
}

- (asimagenode_modification_block_t )imageModBlockWithCorner:(CGFloat )corner MaskImage:(UIImage *)maskImage{
    __weak __typeof(self)weakSelf = self;
    return ^UIImage *(UIImage *originalImg){
        CGSize size = CGSizeMake(weakSelf.calculatedSize.width * [UIScreen mainScreen].scale, weakSelf.calculatedSize.height * [UIScreen mainScreen].scale);
        UIGraphicsBeginImageContext(size);
        UIBezierPath *path = [UIBezierPath
                              bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                              cornerRadius:corner * [UIScreen mainScreen].scale];
        [path addClip];
        [originalImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
        if (maskImage) {
            [maskImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
            
        }
        UIImage *refinedImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return refinedImg;
        
    };
}

@end
