//
//  UserLoginOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/27.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UserLoginOperation.h"

#import "UserManager.h"
#import "TransitionManager.h"

#import "OperationHookInterface.h"

@interface UserLoginOperation () <DelegateHookInterface>

@end

@implementation UserLoginOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
      
        if ([[UserManager shareManager] currentState] != UserStateLogin)
        {
            [TransitionManager presentViewControllerName:@"LoginViewController"
                                                animated:YES
                                          needNavigation:YES
                                              parameters:@{ @"hookDelegate" : self }
                                              completion:nil];
        }
        else
        {
            self.finished = YES;
            self.executing = NO;
        }
    };
}

#pragma mark - Delegate
- (BOOL)delegateDidHandle
{
    [TransitionManager mementoBackViewControllerAnimated:YES completion:nil];
    
    self.finished = YES;
    self.executing = NO;
    return YES;
}

@end






























