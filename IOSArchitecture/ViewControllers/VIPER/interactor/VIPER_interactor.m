//
//  VIPER_interactor.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import "VIPER_interactor.h"
#import "VIPER_entity.h"
#import "VIPER_presenter.h"

@implementation VIPER_interactor

- (id)init:(enum eNextDo)nextDo{
    self = [super init];
    if (self) {
        self.eDataBase1 = nextDo;
        self.entity = [[VIPER_entity alloc] init];
    }
    return self;
}

#pragma mark InteractorInterface
//用一个线程模拟从网络获取数据，耗时：5秒钟，返回数据：333
/*
 *注意：block要回调到主线程。
 */
- (void)getInitialData{
    
    dispatch_queue_t queue = dispatch_queue_create("myQueue1", NULL);
    dispatch_async(queue, ^{
        sleep(5);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.presenter initViewEnd:333];
            [self.entity resetData:333];
        });
    });
}

//用一个线程模拟减法运算，耗时：3秒钟，返回数据：现有值减1；
/*
 *注意：block要回调到主线程。
 */
- (void)increaseOperation{
    dispatch_queue_t queue = dispatch_queue_create("myQueue2", NULL);
    dispatch_async(queue, ^{
        sleep(3);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSInteger i = self.entity.iCount - 1;
            [self.presenter increaseEnd:i];
            [self.entity resetData:i];
        });
    });
}

//加法为同步操作
- (void)addOperation{
    NSInteger i = self.entity.iCount + 1;
    [self.presenter addEnd:i];
    [self.entity resetData:i];
}

//获取导航信息
- (enum eNextDo)getNavigationInfo{
    return self.eDataBase1;
}

#pragma mark memory leak test

- (void)dealloc{
    NSLog(@"计算模块正常释放 interactor");
}





































@end
