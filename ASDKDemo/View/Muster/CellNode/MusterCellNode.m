//
//  NFHomeFilmsCellNode.m
//  LiveShow
//
//  Created by Dee on 2018/1/2.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "MusterCellNode.h"
#import "MusterTwoNode.h"
#import "MusterOneNode.h"
#import "MusterTopNode.h"

@interface MusterCellNode()

@property(nonatomic, strong) MusterTopNode *topNode;
@property(nonatomic, strong) MusterOneNode *oneNode;
@property(nonatomic, strong) MusterTwoNode *twoNode;

@property(nonatomic, strong) NSArray<MusterTwoNode *> *twoNodeArray;

@property(nonatomic, assign) NSInteger count;

@end

@implementation MusterCellNode

- (instancetype)initWithCount:(NSInteger)count{
    self = [super init];
    if (self) {
        _count = count;
        [self setupUIWithCount:count];
        
    }
    return self;
}

- (void)setupUIWithCount:(NSInteger)count{
    
    _topNode = [MusterTopNode new];
    [self addSubnode:_topNode];
    
    _oneNode = [MusterOneNode new];
    [self addSubnode:_oneNode];
    
    
//    NSLog(@"#SUN count %zd", count / 2);
    NSMutableArray<MusterTwoNode *> *twoNodeArray = [NSMutableArray array];
    
    for (int i = 0; i < (count / 2); i++) {
        NSInteger needCount = 2 * (i + 1);
        MusterTwoNode *twoNode = nil;
        
        if (needCount < count) {
            twoNode = [[MusterTwoNode alloc]initWithCount:2];
            
        }else{
            twoNode = [[MusterTwoNode alloc]initWithCount:1];
            
        }
        
        [self addSubnode:twoNode];
        [twoNodeArray addObject:twoNode];
        
    }
    _twoNodeArray = [twoNodeArray copy];
    
}

#pragma mark -layout
-(ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    NSArray *srackChildren = @[_topNode, _oneNode];
    if (_twoNodeArray.count) {
        srackChildren = [srackChildren arrayByAddingObjectsFromArray:_twoNodeArray];
        
    }
    ASStackLayoutSpec *stackSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:16 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStretch children:srackChildren];
    
    ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(16, 16, 16, 16) child:stackSpec];
    
    return insetSpec;
    
}

@end
