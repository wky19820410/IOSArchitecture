//
//  VIPER_Route.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import "VIPER_Route.h"
#import <UIKit/UIKit.h>
#import "VCOne.h"
#import "VCTwo.h"


@implementation VIPER_Route

- (void)doNextVC:(UIViewController *)VC doNext:(enum eNextDo)nextDo{
    if (nextDo == eNextOne) {
        VCOne *vc1 = [VCOne new];
        vc1.hidesBottomBarWhenPushed = YES;
        [VC.navigationController pushViewController:vc1 animated:YES];
    }else if(nextDo == eNextTwo){
        VCTwo *vc2 = [VCTwo new];
        vc2.hidesBottomBarWhenPushed = YES;
        [VC.navigationController pushViewController:vc2 animated:YES];
    }
}

- (void)back:(UIViewController *)VC{
    [VC.navigationController popViewControllerAnimated:YES];
}

#pragma mark memory leak test

- (void)dealloc{
    NSLog(@"计算模块正常释放 router");
}

@end
