//
//  userNode.m
//  ASDKDemo
//
//  Created by Dee on 2017/12/25.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "UserNode.h"

@interface UserNode()

@property(nonatomic, strong) ASNetworkImageNode *userImageNode;
@property(nonatomic, strong) ASTextNode *nameTextNode;
@property(nonatomic, strong) ASButtonNode *attentionButtonNode;
@property(nonatomic, strong) ASButtonNode *settingButtonNode;

@end

@implementation UserNode

- (instancetype)initWithModel:(User_info *)model{
    self = [super init];
    if (self) {
        [self setupUIWithModel:(User_info *)model];
        
    }
    return self;
}

- (void)setupUIWithModel:(User_info *)model{
    _userImageNode = [ASNetworkImageNode createWithURLStr:model.avatar];
    [self addSubnode:_userImageNode];
    
    __weak __typeof(self)weakSelf = self;
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
    
    _nameTextNode = [ASTextNode createWithAttr:[NSAttributedString createWithText:model.username Font:[UIFont systemFontOfSize:14] Color:[UIColor grayColor]]];
    [self addSubnode:_nameTextNode];
    
    _attentionButtonNode = [ASButtonNode createWithText:@"关注" Font:[UIFont systemFontOfSize:14] Color:[UIColor colorWithHex:333333] Image:[UIImage imageNamed:@"home_report"] Spacing:4];
    [self addSubnode:_attentionButtonNode];
    
    _settingButtonNode = [ASButtonNode createWithImage:[UIImage imageNamed:@"dis_more"]];
    [self addSubnode:_settingButtonNode];
    
}

-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    _userImageNode.style.preferredSize = CGSizeMake(25, 25);
    _nameTextNode.style.flexGrow = 1.0;
    _nameTextNode.style.flexShrink = 1.0;
    
    ASStackLayoutSpec *leftStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:4 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsCenter children:@[_userImageNode, _nameTextNode]];
    
    ASStackLayoutSpec *rightStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:4 justifyContent:ASStackLayoutJustifyContentEnd alignItems:ASStackLayoutAlignItemsCenter children:@[_attentionButtonNode, _settingButtonNode]];
    
    ASStackLayoutSpec *userStackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:8 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStretch children:@[leftStackSpec, rightStackSpec]];
    
    return userStackSpec;
}

@end
