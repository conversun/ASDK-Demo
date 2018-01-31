//
//  MusterTwoNode.m
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "MusterTwoNode.h"
#import "ASCategory.h"

@interface MusterTwoNode()

@property(nonatomic, strong) ASNetworkImageNode *leftImageNode;
@property(nonatomic, strong) ASTextNode *leftTitleNode;
@property(nonatomic, strong) ASTextNode *leftSubTitleNode;

@property(nonatomic, strong) ASNetworkImageNode *rightImageNode;
@property(nonatomic, strong) ASTextNode *rightTitleNode;
@property(nonatomic, strong) ASTextNode *rightSubTitleNode;

@property(nonatomic, assign) NSInteger count;

@end

@implementation MusterTwoNode

- (instancetype)initWithCount:(NSInteger)count{
    self = [super init];
    if (self) {
        _count = count;
        
        _leftImageNode = [ASNetworkImageNode createWithURLStr:@"http://filminfo.nfile.cn/filminfo/raw/c4/94/c494ac35bfa8f0424c9b5e9f1c20343f413727f3.jpg"];
        _leftImageNode.imageModificationBlock = [_leftImageNode imageModBlockWithCorner:8];
        [self addSubnode:_leftImageNode];
        _leftTitleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:14 weight:UIFontWeightBold] Color:[UIColor colorWithHex:999999]] LineCount:1];
        [self addSubnode:_leftTitleNode];
        _leftSubTitleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:12] Color:[UIColor colorWithHex:999999]] LineCount:2];
        [self addSubnode:_leftSubTitleNode];
        
        if (_count > 1){
            _rightImageNode = [ASNetworkImageNode createWithURLStr:@"http://filminfo.nfile.cn/filminfo/raw/c4/94/c494ac35bfa8f0424c9b5e9f1c20343f413727f3.jpg"];
            _rightImageNode.imageModificationBlock = [_rightImageNode imageModBlockWithCorner:8];
            [self addSubnode:_rightImageNode];
            _rightTitleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:14 weight:UIFontWeightBold] Color:[UIColor colorWithHex:333333]] LineCount:1];
            [self addSubnode:_rightTitleNode];
            _rightSubTitleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:12] Color:[UIColor colorWithHex:999999]] LineCount:1];
            [self addSubnode:_rightSubTitleNode];
            
        }
    }
    return self;
}

#pragma mark -layout
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    ASDimension textWidth = ASDimensionMake((width - 48)/2.0);
    
    _leftImageNode.style.preferredSize = CGSizeMake((width - 48)/2.0, (((width - 48)/2.0)/16) * 9);
    _rightImageNode.style.preferredSize = CGSizeMake((width - 48)/2.0, (((width - 48)/2.0)/16) * 9);
    
    _leftTitleNode.style.width = textWidth;
    _leftSubTitleNode.style.width = textWidth;
    _rightTitleNode.style.width = textWidth;
    _rightSubTitleNode.style.width = textWidth;
    
    ASStackLayoutSpec *leftStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:4 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_leftImageNode, _leftTitleNode, _leftSubTitleNode]];
    leftStackSpec.style.flexShrink = 1.0;
    leftStackSpec.style.flexGrow = 1.0;
    
        /// 为奇数情况时
    NSArray *stackChild = @[leftStackSpec];
    if (_count > 1){
        ASStackLayoutSpec *rightStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:4 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[_rightImageNode, _rightTitleNode, _rightSubTitleNode]];
        rightStackSpec.style.flexShrink = 1.0;
        rightStackSpec.style.flexGrow = 1.0;
        stackChild = @[leftStackSpec, rightStackSpec];
        
    }
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:16 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:stackChild];
    
    return stackSpec;
}

@end
