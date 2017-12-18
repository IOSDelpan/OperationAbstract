//
//  UserManager.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UserManager.h"

static NSString *const _UserManagerCurrentState = @"UserManagerCurrentState";
static NSString *const _UserManagerTestFinished = @"UserManagerTestFinished";

NSString *const kUMAccountStateDidChange = @"UMAccountStateDidChange";
NSString *const kUMAccountInfoDidChange = @"UMAccountInfoDidChange";

@implementation UserManager

#pragma mark - Life Cycle
+ (instancetype)shareManager
{
    return (UserManager *)self;
}

#pragma mark - Public Methods
#pragma mark -用户登录
+ (void)loginCompletion:(UserManagerCompletion)completion
{
    self.currentState = UserStateLogin;
    !completion ?: completion(YES);
}

#pragma mark -用户登出
+ (void)logoutCompletion:(UserManagerCompletion)completion
{
    self.currentState = UserStateGuest;
    !completion ?: completion(YES);
}

+ (void)updateUserInfoCompletion:(UserManagerCompletion)completion
{
    sleep(1);
    !completion ?: completion(YES);
}

#pragma mark - Set / Get
#pragma mark -用户名
+ (NSString *)userName
{
    return (self.currentState == UserStateLogin) ? @"Delpan" : @"游客";
}

+ (void)setCurrentState:(UserState)currentState
{
    [[NSUserDefaults standardUserDefaults] setInteger:currentState forKey:_UserManagerCurrentState];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kUMAccountStateDidChange object:nil];
}

+ (UserState)currentState
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:_UserManagerCurrentState];
}

+ (void)setTestFinished:(BOOL)testFinished
{
    [[NSUserDefaults standardUserDefaults] setBool:testFinished forKey:_UserManagerTestFinished];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kUMAccountInfoDidChange object:nil];
}

+ (BOOL)testFinished
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:_UserManagerTestFinished];
}

@end




































