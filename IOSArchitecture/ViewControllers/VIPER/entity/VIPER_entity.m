//
//  VIPER_entity.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

/*
 *数据实体：就是个数据结构
 */

#import "VIPER_entity.h"

@implementation VIPER_entity

- (VIPER_entity *)resetData:(NSInteger)iCount{
    _iCount = iCount;
    return self;
}

#pragma mark memory leak test

- (void)dealloc{
    NSLog(@"计算模块正常释放 VIPER_entity");
}

@end
