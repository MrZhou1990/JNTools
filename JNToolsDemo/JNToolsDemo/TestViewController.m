//
//  TestViewController.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/6/21.
//  Copyright © 2019 Cloud. All rights reserved.
//  测试

#import "TestViewController.h"
#import "JNCommon.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试页";
    JNLog(@"哈哈".jn_md5String);
    self.view.backgroundColor = JNRandomColor;
}

@end
