//
//  LoginOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/14.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LoginOperation.h"
#import "UserLoginOperation.h"
#import "UserTestOperation.h"
#import "NSOperation+WBOperation.h"

@implementation LoginOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        UserLoginOperation *userLoginOperation = [UserLoginOperation new];
        UserTestOperation *userTestOperation = [UserTestOperation new];
        [userTestOperation startAfterOperations:userLoginOperation, nil];
        [NSOperationQueue asyncStartOperations:userLoginOperation, userTestOperation, nil];
        
        userTestOperation.completionBlock = ^{
            
            self.finished = YES;
            self.executing = NO;
        };
    };
}

@end


































