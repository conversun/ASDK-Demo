//
//  MusterController.m
//  ASDKDemo
//
//  Created by Dee on 2018/1/31.
//  Copyright © 2018年 Dee. All rights reserved.
//

#import "MusterController.h"
#import "MusterCellNode.h"

@interface MusterController ()<ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) ASTableNode *tableNode;

@end

@implementation MusterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupTableNode];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _tableNode.frame = self.view.bounds;
}

- (void)setupTableNode{
    _tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    _tableNode.backgroundColor = [UIColor whiteColor];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubnode:_tableNode];
    
}

-(NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return 15;
    
}

-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
        //    LSWeMediaModel *model = self.homeViewModel.videoArray[indexPath.row];
    return ^{
        MusterCellNode *cellNode = [[MusterCellNode alloc]initWithCount:indexPath.row + 1];
        return cellNode;
        
    };
}

- (ASSizeRange)tableView:(ASTableView *)tableView constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ASSizeRangeMake(CGSizeMake([UIScreen mainScreen].bounds.size.width, (([UIScreen mainScreen].bounds.size.width - 32)/16) * 9), CGSizeMake([UIScreen mainScreen].bounds.size.width, INFINITY));
}


@end
