//
//  UserTestOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/27.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UserTestOperation.h"

#import "UserManager.h"
#import "TransitionManager.h"

#import "OperationHookInterface.h"

@interface UserTestOperation () <DelegateHookInterface>

@end

@implementation UserTestOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
      
        self.executing = YES;
        
        if ([[UserManager shareManager] testFinished])
        {
            self.finished = YES;
            self.executing = NO;
        }
        else
        {
            [TransitionManager pushViewControllerName:@"TestViewController" animated:YES parameters:@{ @"hookDelegate" : self }];
        }
    };
}

#pragma mark - Delegate
- (BOOL)delegateDidHandle
{
    [TransitionManager mementoBackViewControllerAnimated:YES completion:nil];
    
    if ([[UserManager shareManager] testFinished])
    {
        self.finished = YES;
        self.executing = NO;
    }
    
    return YES;
}

@end






























