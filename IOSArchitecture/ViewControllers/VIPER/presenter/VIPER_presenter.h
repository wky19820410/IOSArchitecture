//
//  VIPER_presenter.h
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "interfaceDeclare.h"

@class VIPER_VIEW_iewController,VIPER_interactor,VIPER_Route;

@interface VIPER_presenter : NSObject< PresenterInterface >

@property (strong,nonatomic) VIPER_interactor<InteractorInterface> *interactor;
@property (weak,nonatomic) VIPER_VIEW_iewController<ViewInterface> *view;
@property (strong,nonatomic) VIPER_Route *route;

- (id)init:(enum eNextDo)nextDo;

@end
