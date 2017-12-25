//
//  ViewController.m
//  ASDKDemo
//
//  Created by Dee on 2017/8/14.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "InfoCellNode.h"
#import <YYModel/YYModel.h>

@interface ViewController ()<ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) ASTableNode *tableNode;
@property(nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"short_video" ofType:@"json"]];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[VideoModel class] json:result[@"data"][@"videos"]];
    
    self.modelArray = [modelArray mutableCopy];
    
    self.tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    self.tableNode.backgroundColor = [UIColor whiteColor];
//    if (@available(iOS 11.0, *)) {
//        self.tableNode.view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    } else {
//
//    }
//
    
    [self.view addSubnode:self.tableNode];
    [self addDelegate];
    [self addLayout];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.tableNode.frame = self.view.bounds;
    
}

- (void)addDelegate{
    self.tableNode.delegate = self;
    self.tableNode.dataSource = self;
    
}

- (void)addLayout{
    self.view.backgroundColor = [UIColor grayColor];
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
    
}

-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoModel *model = self.modelArray[indexPath.row];
    return ^{
        InfoCellNode *infoCellNode = [[InfoCellNode alloc]initWithModel:model];
        return infoCellNode;
        
    };
}

- (ASSizeRange)tableView:(ASTableView *)tableView constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ASSizeRangeMake(CGSizeMake([UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.width/16) * 9),
                           CGSizeMake([UIScreen mainScreen].bounds.size.width, INFINITY));
}

- (BOOL)shouldBatchFetchForTableView:(ASTableView *)tableView {
    return YES;
}

- (void)tableView:(ASTableView *)tableView willBeginBatchFetchWithContext:(ASBatchContext *)context {
        //1
    [self retrieveNextPageWithCompletion:^(NSArray *animals) {
            //2
        [self insertNewRowsInTableView:animals];
        
            //3
        [context completeBatchFetching:YES];
    }];
}


- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block {
    NSArray *moreAnimals = [[NSArray alloc] initWithArray:[self.modelArray subarrayWithRange:NSMakeRange(0, 10)] copyItems:NO];
    
        // Important: this block must run on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        block(moreAnimals);
    });
}

- (void)insertNewRowsInTableView:(NSArray *)newAnimals {
    NSInteger section = 0;
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    NSUInteger newTotalNumberOfPhotos = self.modelArray.count + newAnimals.count;
    for (NSUInteger row = self.modelArray.count; row < newTotalNumberOfPhotos; row++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
        [indexPaths addObject:path];
    }
    
    [self.modelArray addObjectsFromArray:newAnimals];
    [self.tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
//    [self.tableNode.view insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}


@end
