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
        _animalImageNode.placeholderFadeDuration = 0.15;
        _animalImageNode.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubnode:_animalImageNode];
        
        CGSize size = CGSizeMake(([UIScreen mainScreen].bounds.size.width - 32) * [UIScreen mainScreen].scale, ((([UIScreen mainScreen].bounds.size.width - 32)/16) * 9) * [UIScreen mainScreen].scale);
        
        _animalImageNode.imageModificationBlock = ^UIImage *(UIImage *originalImg){
            UIGraphicsBeginImageContext(size);
            UIBezierPath *path = [UIBezierPath
                                  bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height)
                                  cornerRadius:8 * [UIScreen mainScreen].scale];
            [path addClip];
            [originalImg drawInRect:CGRectMake(0, 0, size.width, size.height)];
            [[UIImage qmui_imageWithColor:[UIColor colorWithWhite:0 alpha:0.5]] drawInRect:CGRectMake(0, 0, size.width, size.height)];
            UIImage *refinedImg = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return refinedImg;
            
        };
        
        _userImageNode = [[ASNetworkImageNode alloc] init];
        _userImageNode.URL = [NSURL URLWithString:_video.user_info.avatar];
        _userImageNode.clipsToBounds = YES;
        _userImageNode.placeholderFadeDuration = 0.15;
        _userImageNode.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubnode:_userImageNode];
        
        _userImageNode.imageModificationBlock = ^UIImage *(UIImage *originalImg){
            UIGraphicsBeginImageContext(originalImg.size);
            UIBezierPath *path = [UIBezierPath
                                  bezierPathWithRoundedRect:CGRectMake(0, 0, originalImg.size.width, originalImg.size.height)
                                  cornerRadius:MIN(originalImg.size.width,originalImg.size.height)/2];
            [path addClip];
            [originalImg drawInRect:CGRectMake(0, 0, originalImg.size.width, originalImg.size.height)];
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
    CGFloat ratio = constrainedSize.min.height/constrainedSize.min.width;
    
    ASRatioLayoutSpec *imageRatioSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:ratio child:self.animalImageNode];
    ASInsetLayoutSpec *imageInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16, 16, 16, 16) child:imageRatioSpec];
    
    ASRelativeLayoutSpec *relativeSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionStart sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:_animalNameTextNode];
    ASInsetLayoutSpec *nameInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16 + 8, 16 + 8, 0, 16 + 8) child:relativeSpec];
    ASOverlayLayoutSpec *nameOverSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:imageInsetSpec overlay:nameInsetSpec];
    
    _userImageNode.style.preferredSize = CGSizeMake(40, 40);
    ASRelativeLayoutSpec *relativeUserSpec = [ASRelativeLayoutSpec relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionStart verticalPosition:ASRelativeLayoutSpecPositionEnd sizingOption:ASRelativeLayoutSpecSizingOptionDefault child:_userImageNode];
    ASInsetLayoutSpec *userInsetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 24, 24, 0) child:relativeUserSpec];
    ASOverlayLayoutSpec *userSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:nameOverSpec overlay:userInsetSpec];
    
    ASCenterLayoutSpec *centerSpec = [ASCenterLayoutSpec centerLayoutSpecWithCenteringOptions:ASCenterLayoutSpecCenteringXY sizingOptions:ASCenterLayoutSpecSizingOptionDefault child:_animalDescriptionTextNode];
    ASOverlayLayoutSpec *timeSpec = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:userSpec overlay:centerSpec];
    
    return timeSpec;
}

-(NSDictionary *)asAttributes{
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.alignment = NSTextAlignmentRight;
    
    return @{NSForegroundColorAttributeName:[[UIColor redColor] colorWithAlphaComponent:0.6],NSFontAttributeName:[UIFont italicSystemFontOfSize:15],NSParagraphStyleAttributeName:style};
}

@end
