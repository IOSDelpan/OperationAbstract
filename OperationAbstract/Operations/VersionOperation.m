//
//  VersionOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/15.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "VersionOperation.h"
#import "SettingManager.h"

@implementation VersionOperation

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSingleton;
}

- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        [[SettingManager shareManager] versionCheckedCompletion:^(NSString *message) {
            
            NSLog(@"%@", message);
        }];
        
        self.finished = YES;
        self.executing = NO;
    };
}

@end

















