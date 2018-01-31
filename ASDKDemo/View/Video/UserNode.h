//
//  userNode.h
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "VideoModel.h"
#import "UIColor+Hex.h"

@interface UserNode : ASDisplayNode

- (instancetype)initWithModel:(User_info *)model;

@end
