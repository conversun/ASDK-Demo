//
//  InfoCellNode.h
//  ASDKDemo
//
//  Created by Dee on 2017/8/17.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "VideoModel.h"
#import "Factories.h"
#import <QMUIKit/QMUIKit.h>

@interface InfoCellNode : ASCellNode

-(instancetype)initWithModel:(Videos *)video;

@end
