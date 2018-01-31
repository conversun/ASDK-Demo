//
//  ASTableNode+DE.h
//  LiveShow
//
//  Created by Dee on 2018/1/9.
//  Copyright © 2018年 NiceFilm. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ASTableNode (DE)


/**
 插入 Row

 @param start 开始位置
 @param count 新数量
 */
- (void)insertRowWithStart:(NSInteger)start NewCount:(NSInteger)count;

@end
