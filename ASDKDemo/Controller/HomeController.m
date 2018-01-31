//
//  HomeController.m
//  ASDKDemo
//
//  Created by Dee on 2018/1/31.
//  Copyright © 2018年 Dee. All rights reserved.
//

#import "HomeController.h"
#import "VideoController.h"
#import "MusterController.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    
}

- (IBAction)videoEvent:(UIButton *)sender {
    [self.navigationController pushViewController:[VideoController new] animated:YES];
    
}

- (IBAction)musterEvent:(UIButton *)sender {
    [self.navigationController pushViewController:[MusterController new] animated:YES];
    
}

@end
