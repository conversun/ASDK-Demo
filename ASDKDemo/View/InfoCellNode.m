//
//  InfoCellNode.m
//  ASDKDemo
//
//  Created by Dee on 2017/8/17.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "InfoCellNode.h"

@interface InfoCellNode ()

@property(nonatomic, strong) Videos *video;

@property (strong, nonatomic) ASNetworkImageNode *animalImageNode;

@property (strong, nonatomic) ASTextNode *animalNameTextNode;

@property (strong, nonatomic) ASTextNode *animalDescriptionTextNode;

@property(nonatomic, strong) ASNetworkImageNode *userImageNode;

@end

@implementation InfoCellNode

-(instancetype)initWithModel:(Videos *)video{
    if (self = [super init]) {
        _video = video;
        
        _animalImageNode = [[ASNetworkImageNode alloc] init];
        _animalImageNode.URL = [NSURL URLWithString:_video.cover];
        _animalImageNode.clipsToBounds = YES;
        _animalImageNode.placeholderFadeDuration = 0.5;
        _animalImageNode.placeholderEnabled = YES;
        _animalImageNode.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubnode:_animalImageNode];
        
        __weak __typeof(self)weakSelf = self;
        _animalImageNode.imageModificationBlock = ^UIImage *(UIImage *originalImg){
            
            CGSize size = CGSizeMake(weakSelf.animalImageNode.calculatedSize.width * [UIScreen mainScreen].scale, weakSelf.animalImageNode.calculatedSize.height * [UIScreen mainScreen].scale);
            
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
        
        _userImageNode = [[ASNetworkImageNode alloc] init];
        _userImageNode.URL = [NSURL URLWithString:_video.user_info.avatar];
        _userImageNode.clipsToBounds = YES;
        _userImageNode.placeholderFadeDuration = 0.5;
        _userImageNode.placeholderEnabled = YES;
        _userImageNode.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubnode:_userImageNode];
        
        _userImageNode.imageModificationBlock = ^UIImage *(UIImage *originalImg){
            CGSize size = CGSizeMake(weakSelf.userImageNode.calculatedSize.width * [UIScreen mainScreen].scale, weakSelf.userImageNode.calculatedSize.height * [UIScreen mainScreen].scale);
            UIGraphicsBeginImageContext(size);
            UIBezierPath *path = [UIBezierPath
                                  bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                  cornerRadius:MIN(size.width,size.height)/2];
            [path addClip];
            [originalImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
            UIImage *refinedImg = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            return refinedImg;
            
        };
        
        _animalNameTextNode = [ASTextNode new];
        _animalNameTextNode.attributedText = [NSAttributedString attributedStringForDescription:_video.title];
        _animalNameTextNode.placeholderEnabled = YES;
        _animalNameTextNode.placeholderFadeDuration = 0.5;
        _animalNameTextNode.placeholderColor = [UIColor colorWithWhite:0.777 alpha:1.0];
        [self addSubnode:_animalNameTextNode];
        
        _animalDescriptionTextNode = [ASTextNode new];
        _animalDescriptionTextNode.attributedText = [NSAttributedString attributedStringForDescription:_video.user_info.username];
        _animalDescriptionTextNode.placeholderEnabled = YES;
        _animalDescriptionTextNode.placeholderFadeDuration = 0.5;
        _animalDescriptionTextNode.placeholderColor = [UIColor colorWithWhite:0.777 alpha:1.0];
        [self addSubnode:_animalDescriptionTextNode];
        
    }
    return self;
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    
    _animalImageNode.style.preferredSize = CGSizeMake(constrainedSize.min.width - 32, ((constrainedSize.min.width - 32)/16) * 9);
    _animalNameTextNode.textContainerInset = UIEdgeInsetsMake(0, 8, 8, 8);
    ASRelativeLayoutSpec *relativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:_animalNameTextNode];
    ASOverlayLayoutSpec *nameOverSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:_animalImageNode overlay:relativeSpec];
    
    _userImageNode.style.preferredSize = CGSizeMake(25, 25);
    ASRelativeLayoutSpec *relativeUserSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:_userImageNode];
    ASOverlayLayoutSpec *userSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:nameOverSpec overlay:relativeUserSpec];
    
    ASCenterLayoutSpec *centerSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionDefault child:_animalDescriptionTextNode];
    ASOverlayLayoutSpec *timeSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:userSpec overlay:centerSpec];
    
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[nameOverSpec, _userImageNode]];
    
    ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16, 16, 0, 16) child:stackSpec];
    
    return insetSpec;
}

-(NSDictionary *)asAttributes{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.alignment = NSTextAlignmentRight;
    
    return @{NSForegroundColorAttributeName:[[UIColor redColor] colorWithAlphaComponent:0.6],NSFontAttributeName:[UIFont italicSystemFontOfSize:15],NSParagraphStyleAttributeName:style};
}

@end
