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
    NSString *dateString = @"2019-11-21 15:52:47";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    NSDate *date = [formatter dateFromString:dateString];
    NSLog(@"%@", date.jn_dateZero);
}

@end
