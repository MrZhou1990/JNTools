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
    NSString *urlString = @"https://www.zhiliangwang.com/zlmall/AppZlGoodInfoController/queryZlGoodInfoPageListByCondittion.json?condition&pageSize=15&priceend&pricestart&processor.pageIndex=1&zlGoodsInfo.goodname&zlGoodsInfo.goodtypet=edd10b7fe7404ae2a6c13f5a6831e3a6&zlGoodsInfo.groupon=0&zlGoodsInfo.regionalid=b31244d6cc1e4bc1b843a70348565a7f";
    [JNNetworkManager jn_getRequestWithUrlString:urlString parameters:nil success:^(id  _Nonnull responObject) {
        JNLog(@"%@", responObject);
        
    } failure:^(NSError * _Nonnull error) {
//        JNLog(@"%@", error);
    }];
}

@end
