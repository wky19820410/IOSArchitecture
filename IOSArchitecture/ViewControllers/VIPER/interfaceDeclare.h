//
//  interfaceDeclare.h
//  IOSArchitecture
//
//  Created by wky on 16/3/20.
//  Copyright © 2016年 wky. All rights reserved.
//

#ifndef interfaceDeclare_h
#define interfaceDeclare_h

@class UIViewController;

enum eNextDo{
    eNextOne,
    eNextTwo
};

@class VIPER_entity;

@protocol ViewInterface <NSObject>

- (void)showLoading:(BOOL)bFlag;
- (void)update:(NSString *)string;

@end

@protocol PresenterInterface <NSObject>

- (void)initViewStart;
- (void)initViewEnd:(NSInteger)i;

- (void)increaseStart;
- (void)increaseEnd:(NSInteger)i;

- (void)addStart;
- (void)addEnd:(NSInteger)i;

- (void)nextDo;
- (void)back;

@end

@protocol InteractorInterface <NSObject>

- (void)getInitialData;
- (void)increaseOperation;
- (void)addOperation;
- (enum eNextDo)getNavigationInfo;

@end

@protocol EntityInterface <NSObject>

- (VIPER_entity *)resetData:(NSInteger)iCount;

@end

@protocol RouterInterface <NSObject>

- (void)doNextVC:(UIViewController *)VC doNext:(enum eNextDo)nextDo;
- (void)back:(UIViewController *)VC;

@end


#endif /* interfaceDeclare_h */
