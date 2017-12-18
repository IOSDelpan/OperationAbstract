//
//  UserUpdateInfoOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/28.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UserUpdateInfoOperation.h"
#import "UserManager.h"

@implementation UserUpdateInfoOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        [[UserManager shareManager] updateUserInfoCompletion:^(BOOL success) {
            
            NSLog(@"已更新用户信息");
            self.finished = YES;
            self.executing = NO;
        }];
    };
}

@end























