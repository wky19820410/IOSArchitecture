//
//  VIPER_interactor.h
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceDeclare.h"

@class VIPER_entity,VIPER_presenter;

@interface VIPER_interactor : NSObject< InteractorInterface >

@property (strong,nonatomic) VIPER_entity< EntityInterface > * entity;
@property (weak,nonatomic) VIPER_presenter< PresenterInterface > * presenter;

//当作数据库使用，demo嘛，主要是说明原理,本例子的数据来源是初始化得到，也可以通过网络获取，或计算得到，用于控制当前viewconroller的导航。
@property (nonatomic) enum eNextDo eDataBase1;

- (id)init:(enum eNextDo)nextDo;

@end
