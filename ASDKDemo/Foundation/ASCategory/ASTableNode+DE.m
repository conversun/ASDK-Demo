//
//  ASTableNode+DE.m
//  LiveShow
//
//  Created by Dee on 2018/1/9.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import "ASTableNode+DE.h"

@implementation ASTableNode (DE)

    /// 插入 Row
- (void)insertRowWithStart:(NSInteger)start NewCount:(NSInteger)count{
    NSInteger section = 0;
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (NSUInteger row = start; row < count; row++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
        [indexPaths addObject:path];
        
    }
    [self insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
}

@end
