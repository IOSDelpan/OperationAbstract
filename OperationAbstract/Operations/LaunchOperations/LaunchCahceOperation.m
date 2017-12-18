//
//  LaunchCahceOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/28.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LaunchCahceOperation.h"
#import "WBCache.h"

static NSString *const _WBCacheDefaultSettingCache = @"WBCacheDefaultSetting";

@implementation LaunchCahceOperation

#pragma mark - Template Sub Methods
- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        // 配置本地缓存
        [[WBCache shareCache] setCountLimit:NSUIntegerMax];
        [[WBCache shareCache] setTotalCostLimit:NSUIntegerMax];
        [[WBCache shareCache] dataForKey:_WBCacheDefaultSettingCache async:NO completion:^(NSData *data, NSString *key) {
            
            NSLog(@"已加载本地缓存");
            self.finished = YES;
            self.executing = NO;
        }];
    };
}

@end






























