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
    NSLog(@"%@", [NSDate jn_currentSystemTimeWithDateType:JNDateTypeYearMonthDayHourMinuteSecond is24Hour:YES]);
}

@end
