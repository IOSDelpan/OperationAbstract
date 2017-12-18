//
//  LaunchViewOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/29.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LaunchViewOperation.h"
#import <UIKit/UIWindow.h>

#import "LaunchViewController.h"

@implementation LaunchViewOperation
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
        
        if (_window)
        {
            *_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
            [*_window setBackgroundColor:[UIColor whiteColor]];
            [*_window setRootViewController:[UIViewController new]];
            [*_window makeKeyAndVisible];
        }
        
        // 启动面
        UIWindow *launchWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        launchWindow.backgroundColor = [UIColor whiteColor];
        launchWindow.windowLevel = UIWindowLevelAlert;
        launchWindow.hidden = NO;
        
        LaunchViewController *launchController = [LaunchViewController new];
        launchController.launchWindow = launchWindow;
        launchWindow.rootViewController = launchController;
        
        self.finished = YES;
        self.executing = NO;
    };
}

@end























