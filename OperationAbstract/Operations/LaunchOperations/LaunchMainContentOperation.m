//
//  LaunchMainContentOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/29.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LaunchMainContentOperation.h"
#import "TransitionManager.h"

#import "MainViewController.h"

@implementation LaunchMainContentOperation
{
    __strong UIWindow **_window;
}

#pragma mark - Life cycle
- (instancetype)initWithWindow:(__strong UIWindow **)window
{
    if (self = [super init])
    {
        _window = window;
    }
    
    return self;
}

- (void)dealloc
{
    _window = nil;
}

#pragma mark - Template Sub Methods
- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
        
        self.executing = YES;
        
        if (*_window)
        {
            [*_window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[MainViewController new]]];
            
            // 配置TransitionManager
            TransitionManager.rootViewController = [*_window rootViewController];
            TransitionManager.navigationControllerClass = [UINavigationController class];
        }
        
        self.finished = YES;
        self.executing = NO;
    };
}

@end

































