//
//  VIPER_presenter.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//
/*
 * 展现器的作用：从交互器获得的数据，进行view显示前的逻辑修改，负责view展现前的逻辑修改
 */
#import "VIPER_presenter.h"
#import "VIPER_interactor.h"
#import "VIPER_VIEW_iewController.h"
#import "VIPER_Route.h"

@implementation VIPER_presenter

- (id)init:(enum eNextDo)nextDo{
    self = [super init];
    if (self) {
        self.interactor = [[VIPER_interactor alloc] init:nextDo];
        _interactor.presenter = self;
        self.route = [[VIPER_Route alloc] init];
    }
    return self;
}

#pragma mark PresenterInterface
//从交互器获取数据，是异步操作 （平时工作经常遇到）
- (void)initViewStart{
    [self.view showLoading:YES];
    [self.interactor getInitialData];
}
- (void)initViewEnd:(NSInteger)i{
    [self.view update:[NSString stringWithFormat:@"初始化的结果%ld",i]];
    [self.view showLoading:NO];
}

//交互器进行减法运算，是异步操作
- (void)increaseStart{
    [self.view showLoading:YES];
    [self.interactor increaseOperation];
}
- (void)increaseEnd:(NSInteger)i{
    [self.view update:[NSString stringWithFormat:@"减1结果：%ld",i]];
    [self.view showLoading:NO];
}

//加法操作为同步(没有等待的小菊花):2个接口方法可以合并成一个方法
- (void)addStart{
    [self.interactor addOperation];
}
- (void)addEnd:(NSInteger)i{
    [self.view update:[NSString stringWithFormat:@"加一的结果：%ld",i]];
}

//控制路由器，进行导航操作
- (void)nextDo{
    [self.route doNextVC:self.view doNext:[self.interactor getNavigationInfo]];
}
- (void)back{
    [self.route back:self.view];
}

#pragma mark memory leak test

- (void)dealloc{
    NSLog(@"计算模块正常释放 presenter");
}

@end









































