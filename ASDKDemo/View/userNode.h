//
//  userNode.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "VideoModel.h"
#import "ASCategory.h"

@interface userNode : ASDisplayNode

- (instancetype)initWithModel:(User_info *)model;

@end
