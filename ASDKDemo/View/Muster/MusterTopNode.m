//
//  MusterTopNode.m
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "MusterTopNode.h"
#import "ASCategory.h"

@interface MusterTopNode()

@property(nonatomic, strong) ASTextNode *titleNode;
@property(nonatomic, strong) ASButtonNode *moreButtonNode;

@end

@implementation MusterTopNode

- (instancetype)init{
    self = [super init];
    if (self) {
        _titleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"二级标题" Font:[UIFont systemFontOfSize:18 weight:UIFontWeightBold] Color:[UIColor colorWithHex:333333]] LineCount:1];
        [self addSubnode:_titleNode];
        
        _moreButtonNode = [ASButtonNode createWithText:@"More" Font:[UIFont systemFontOfSize:14] Color:[UIColor colorWithHex:666666] Image:[UIImage imageNamed:@"definition_more"] Spacing:4];
        _moreButtonNode.imageAlignment = ASButtonNodeImageAlignmentEnd;
        [self addSubnode:_moreButtonNode];
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    _titleNode.style.flexGrow = 1.0;
    _titleNode.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[_titleNode, _moreButtonNode]];
    
    return stackSpec;
    
}

@end
