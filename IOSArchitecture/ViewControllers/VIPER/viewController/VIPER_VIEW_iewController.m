//
//  VIPER_VIEW_iewController.m
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import "VIPER_VIEW_iewController.h"
#import "VIPER_presenter.h"
#import "MBProgressHUD.h"

@interface VIPER_VIEW_iewController ()

@property (strong,nonatomic) VIPER_presenter *presenter;//展现器

@property (weak, nonatomic) IBOutlet UILabel *labShow;
@property (weak, nonatomic) MBProgressHUD *hub;

@end

@implementation VIPER_VIEW_iewController

- (id)init:(enum eNextDo)nextDo{
    self = [super init];
    if (self) {
        self.presenter = [[VIPER_presenter alloc] init:nextDo];
        _presenter.view = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNavigationBar];
  
    [self.presenter initViewStart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark button action
- (IBAction)btnActionIncrease:(id)sender {
    [self.presenter increaseStart];
}
- (IBAction)btnActionAdd:(id)sender {
    [self.presenter addStart];
}

#pragma mark ViewInterface

- (void)showLoading:(BOOL)bFlag{
    if (bFlag) {
        MBProgressHUD *hub = [[MBProgressHUD alloc] initWithView:self.view];
        self.hub = hub;
        self.hub.removeFromSuperViewOnHide = YES;
        [self.view addSubview:self.hub];
        [self.hub show:bFlag];
    }else{
        [self.hub hide:YES];
    }
}

- (void)update:(NSString *)string{
    self.labShow.text = string;
}

#pragma mark init navigationbar
- (void)initNavigationBar{
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back setFrame:CGRectMake(0, 0, 40, 40)];
    back.backgroundColor = [UIColor blueColor];
    [back addTarget:self action:@selector(btnActionReturn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:back];
    
    UIBarButtonItem *barItemLeftSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barItemLeftSpace.width = -10;
    
    self.navigationItem.leftBarButtonItems = @[barItemLeftSpace, barButton];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setTitle:@"下一步" forState:UIControlStateNormal];
    [btnRight setFrame:CGRectMake(0, 0, 60, 40)];
    btnRight.backgroundColor = [UIColor blackColor];
    [btnRight addTarget:self action:@selector(btnActionNext) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonRight = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    
    UIBarButtonItem *barItemRightSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    barItemRightSpace.width = -10;
    
    self.navigationItem.rightBarButtonItems = @[barItemRightSpace, barButtonRight];
    
    self.navigationItem.title = @"viper设计demo";
}

#pragma mark navigation action
- (void)btnActionReturn{
    [self.presenter back];
}
- (void)btnActionNext{
    [self.presenter nextDo];
}

#pragma mark memory leak test

- (void)dealloc{
    NSLog(@"计算模块正常释放 view");
}

@end













































