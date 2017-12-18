//
//  LaunchNetworkConfigOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/29.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LaunchNetworkConfigOperation.h"
#import "Networking.h"

@implementation LaunchNetworkConfigOperation

#pragma mark - Template Sub Methods
- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return ^{
        
        self.executing = YES;
        
        [[Networking shareNetworking] configCompletion:^(BOOL success) {
            
            NSLog(@"初始化URLCache，URLProtocol，DNS防劫持，操作完成");
            self.finished = YES;
            self.executing = NO;
        }];
    };
}

@end


























