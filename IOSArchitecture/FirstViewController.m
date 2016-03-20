//
//  FirstViewController.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import "FirstViewController.h"
#import "VIPER_VIEW_iewController.h"
#import "Common.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionVIPER_DEMO:(id)sender {
//    VIPER_VIEW_iewController *VC = [[VIPER_VIEW_iewController alloc] init:eNextOne];
    VIPER_VIEW_iewController *VC = [[VIPER_VIEW_iewController alloc] init:eNextTwo];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
