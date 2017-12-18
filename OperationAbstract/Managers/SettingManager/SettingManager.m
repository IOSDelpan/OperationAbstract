//
//  SettingManager.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "SettingManager.h"
#import "WBCache.h"

@implementation SettingManager

#pragma mark - Life Cycle
+ (instancetype)shareManager
{
    return (SettingManager *)self;
}

#pragma mark - Public Methods
+ (void)versionCheckedCompletion:(void (^)(NSString *message))completion
{
    sleep(1);
    !completion ?: completion(@"当前已是最新的版本");
}

+ (void)updateSettingCompletion:(void (^)(BOOL success))completion
{
    sleep(1);
    !completion ?: completion(YES);
}

+ (UIImage *)launchImage
{
    return nil;
}

@end



































