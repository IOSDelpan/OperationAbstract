//
//  UserUpdateSettingOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/29.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UserUpdateSettingOperation.h"
#import "SettingManager.h"

@implementation UserUpdateSettingOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        [[SettingManager shareManager] updateSettingCompletion:^(BOOL success) {
            
            NSLog(@"已更新用户设置");
            self.finished = YES;
            self.executing = NO;
        }];
    };
}

@end



















