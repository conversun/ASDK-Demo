//
//  InfoCellNode.m
//  ASDKDemo
//
//  Created by Dee on 2017/8/17.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "InfoCellNode.h"
#import "UserNode.h"

@interface InfoCellNode ()

@property(nonatomic, strong) VideoModel *video;

@property (strong, nonatomic) ASNetworkImageNode *postImageNode;

@property (strong, nonatomic) ASTextNode *titleTextNode;

@property (strong, nonatomic) ASTextNode *subTitleTextNode;

@property(nonatomic, strong) ASNetworkImageNode *userImageNode;

@property(nonatomic, strong) UserNode *userNode;

@end

@implementation InfoCellNode

-(instancetype)initWithModel:(VideoModel *)video{
    if (self = [super init]) {
        _video = video;
        
        _postImageNode = [ASNetworkImageNode createWithURLStr:_video.cover];
        [self addSubnode:_postImageNode];
        
        __weak __typeof(self)weakSelf = self;
        _postImageNode.imageModificationBlock = ^UIImage *(UIImage *originalImg){
            
            CGSize size = CGSizeMake(weakSelf.postImageNode.calculatedSize.width * [UIScreen mainScreen].scale, weakSelf.postImageNode.calculatedSize.height * [UIScreen mainScreen].scale);
            
            UIGraphicsBeginImageContext(size);
            UIBezierPath *path = [UIBezierPath
                                  bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                  cornerRadius:8 * [UIScreen mainScreen].scale];
            [path addClip];
            [originalImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
            [[UIImage imageWithColor:[UIColor colorWithWhite:0 alpha:0.5]] drawInRect:CGRectMake(0, 0, size.width, size.height)];
            UIImage *refinedImg = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return refinedImg;
            
        };
        
        _titleTextNode = [ASTextNode createWithAttr:[NSAttributedString attributedStringForDescription:_video.title]];
        [self addSubnode:_titleTextNode];
        
        _userNode = [[UserNode alloc]initWithModel:_video.user_info];
        [self addSubnode:_userNode];
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    _postImageNode.style.preferredSize = CGSizeMake(constrainedSize.min.width - 32, ((constrainedSize.min.width - 32)/16) * 9);
    _titleTextNode.textContainerInset = UIEdgeInsetsMake(8, 8, 8, 8);
    ASRelativeLayoutSpec *relativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:_titleTextNode];
    ASOverlayLayoutSpec *nameOverSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_postImageNode overlay:relativeSpec];
    
    _userImageNode.style.preferredSize = CGSizeMake(25, 25);
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[nameOverSpec, _userNode]];
    
    ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16, 16, 0, 16) child:stackSpec];
    
    return insetSpec;
}

-(NSDictionary *)asAttributes{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.alignment = NSTextAlignmentRight;
    
    return @{NSForegroundColorAttributeName:[[UIColor redColor] colorWithAlphaComponent:0.6],NSFontAttributeName:[UIFont italicSystemFontOfSize:15],NSParagraphStyleAttributeName:style};
}

@end
