//
//  AppDelegate.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/7.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "AppDelegate.h"

#import "InfoCollectedManager.h"

#import "LaunchCahceOperation.h"
#import "LaunchNetworkConfigOperation.h"
#import "LaunchViewOperation.h"
#import "UserUpdateInfoOperation.h"
#import "LaunchMainContentOperation.h"
#import "UserUpdateSettingOperation.h"
#import "VersionOperation.h"
#import "NSOperation+WBOperation.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[InfoCollectedManager shareManager] start];
    [self _initOperations];
    return YES;
}

#pragma mark - Private Methods
- (void)_initOperations
{
    // 本地资源文件缓存
    LaunchCahceOperation *cacheOperation = [LaunchCahceOperation new];
    // 网络配置
    LaunchNetworkConfigOperation *networkOperation = [LaunchNetworkConfigOperation new];
    // 启动页
    LaunchViewOperation *launchViewOperation = [[LaunchViewOperation alloc] initWithWindow:&_window];
    // 检测版本
    VersionOperation *versionOperation = [VersionOperation new];
    // 更新用户信息
    UserUpdateInfoOperation *updateInfoOperation = [UserUpdateInfoOperation new];
    // 内容页
    LaunchMainContentOperation *mainContentOperation = [[LaunchMainContentOperation alloc] initWithWindow:&_window];
    // 更新用户设置
    UserUpdateSettingOperation *updateSettingOperation = [UserUpdateSettingOperation new];
    
    // 设置操作间的关系
    [mainContentOperation startAfterOperations:cacheOperation, networkOperation, launchViewOperation, nil];
    [versionOperation startAfterOperations:networkOperation, nil];
    [updateInfoOperation startAfterOperations:networkOperation, nil];
    [updateSettingOperation startAfterOperations:updateInfoOperation, nil];
    
    // 启动操作
    [NSOperationQueue syncStartOperations:cacheOperation, networkOperation, launchViewOperation, nil];
    [NSOperationQueue asyncStartOperations:versionOperation, updateInfoOperation, mainContentOperation, updateSettingOperation, nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [NSOperationQueue asyncStartOperations:[VersionOperation new], [UserUpdateInfoOperation new], nil];
}

@end























