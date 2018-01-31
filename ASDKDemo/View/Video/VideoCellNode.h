//
//  VideoCellNode.h
//  ASDKDemo
//
//  Created by Dee on 2017/8/17.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "VideoModel.h"
#import "Factories.h"
#import "UIImage+Color.h"

@interface VideoCellNode : ASCellNode

-(instancetype)initWithModel:(VideoModel *)video;

@end
