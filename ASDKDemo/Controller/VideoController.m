//
//  ViewController.m
//  ASDKDemo
//
//  Created by Dee on 2017/8/14.
//  Copyright © 2017年 Dee. All rights reserved.
//

#import "VideoController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "VideoCellNode.h"
#import <YYModel/YYModel.h>

@interface VideoController ()<ASTableDelegate, ASTableDataSource>

@property(nonatomic, strong) ASTableNode *tableNode;
@property(nonatomic, strong) NSMutableArray *modelArray;

@end

@implementation VideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    [self addTableNode];
    
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.tableNode.frame = self.view.bounds;
    
}

- (void)loadData{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"short_video" ofType:@"json"]];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[VideoModel class] json:result[@"data"][@"videos"]];
    self.modelArray = [modelArray mutableCopy];
    
}

- (void)addTableNode{
    self.tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    self.tableNode.backgroundColor = [UIColor whiteColor];
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubnode:self.tableNode];
    
    self.tableNode.delegate = self;
    self.tableNode.dataSource = self;
    
}

-(NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
    
}

-(ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoModel *model = self.modelArray[indexPath.row];
    return ^{
        VideoCellNode *videoCellNode = [[VideoCellNode alloc]initWithModel:model];
        return videoCellNode;
        
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
    [self retrieveNextPageWithCompletion:^(NSArray *animals) {
        [self insertNewRowsInTableView:animals];
        [context completeBatchFetching:YES];
        
    }];
}


- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block {
    NSArray *moreAnimals = [[NSArray alloc] initWithArray:[self.modelArray subarrayWithRange:NSMakeRange(0, 10)] copyItems:NO];
    dispatch_async(dispatch_get_main_queue(), ^{
        block(moreAnimals);
        
    });
}

- (void)insertNewRowsInTableView:(NSArray *)newAnimals {
    NSInteger oldCount = self.modelArray.count;
    [self.modelArray addObjectsFromArray:newAnimals];
    [self.tableNode insertRowWithStart:oldCount NewCount:self.modelArray.count];
    
}


@end
