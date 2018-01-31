//
//  MusterOneNode.m
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "MusterOneNode.h"
#import "ASCategory.h"

@interface MusterOneNode()

@property(nonatomic, strong) ASNetworkImageNode *postImageNode;
@property(nonatomic, strong) ASTextNode *titleNode;
@property(nonatomic, strong) ASTextNode *subTitleNode;

@end

@implementation MusterOneNode

- (instancetype)init{
    self = [super init];
    if (self) {
        _postImageNode = [ASNetworkImageNode createWithURLStr:@"http://filminfo.nfile.cn/filminfo/raw/c4/94/c494ac35bfa8f0424c9b5e9f1c20343f413727f3.jpg"];
        [self addSubnode:_postImageNode];
        _titleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:14 weight:UIFontWeightBold] Color:[UIColor whiteColor]] LineCount:1];
        [self addSubnode:_titleNode];
        _subTitleNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:@"TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle" Font:[UIFont systemFontOfSize:14] Color:[UIColor whiteColor]] LineCount:1];
        [self addSubnode:_subTitleNode];
        
        _postImageNode.imageModificationBlock = [_postImageNode imageMaskScreenBlock];
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    ASRatioLayoutSpec *postImageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:9.0/16.0 child:_postImageNode];
    
    ASInsetLayoutSpec *titleInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 8, 8, 8) child:_titleNode];
    ASInsetLayoutSpec *subTitleInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 8, 8, 8) child:_subTitleNode];
    
    ASStackLayoutSpec *titleStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[subTitleInsetSpec, titleInsetSpec]];
    
    ASRelativeLayoutSpec *relativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:titleStackSpec];
    ASOverlayLayoutSpec *nameOverSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:postImageRatioSpec overlay:relativeSpec];
    return nameOverSpec;
    
}

@end
