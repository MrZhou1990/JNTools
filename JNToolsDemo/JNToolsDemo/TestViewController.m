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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self jn_testMethod];
}

- (void)jn_testMethod {
    [MBProgressHUD jn_promptMessage:@"似乎断开了网络"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD jn_loadingMessage:@"哈哈" toView:self.view];
    });
}

@end
