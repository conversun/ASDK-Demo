//
//  ASNetworkImageNode+DE.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASNetworkImageNode (DE)

+ (ASNetworkImageNode *)createWithURLStr:(NSString *)urlStr;

/**
 增加圆角 8 和遮罩 mask_smallscreen
 
 @return asimagenode_modification_block_t
 */
- (asimagenode_modification_block_t )imageMaskScreenBlock;

/**
 图片下载后自定义处理
 
 @param corner 圆角
 @return asimagenode_modification_block_t
 */
- (asimagenode_modification_block_t )imageModBlockWithCorner:(CGFloat )corner;

/**
 图片下载后自定义处理
 
 @param corner 圆角
 @param maskImage 遮罩图
 @return asimagenode_modification_block_t
 */
- (asimagenode_modification_block_t )imageModBlockWithCorner:(CGFloat )corner MaskImage:(UIImage *)maskImage;

@end
