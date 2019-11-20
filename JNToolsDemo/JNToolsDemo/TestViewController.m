//
//  TestViewController.m
//  JNToolsDemo
//
//  Created by Cloud on 2019/9/3.
//  Copyright © 2019 Cloud. All rights reserved.
//

#import "TestViewController.h"
#import "JNTools/JNCommon.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试页";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.view.backgroundColor = [UIColor jn_colorWithRGBColorRed:0 green:0 blue:0 alpha:.5];
}

@end
