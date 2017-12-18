//
//  UserManager.h
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UserState)
{
    UserStateLogin = 0,
    UserStateGuest = 1
};

extern NSString *const kUMAccountStateDidChange;
extern NSString *const kUMAccountInfoDidChange;

/** 用户操作回调 */
typedef void (^UserManagerCompletion)(BOOL success);

@interface UserManager : NSObject

+ (instancetype)shareManager;

/** 用户名 */
@property (nonatomic, copy) NSString *userName;
/** 用户当前状态 */
@property (nonatomic, assign) UserState currentState;
/** 是否完成测试 */
@property (nonatomic, assign) BOOL testFinished;

/** 用户登录 */
- (void)loginCompletion:(UserManagerCompletion)completion;
/** 用户登出 */
- (void)logoutCompletion:(UserManagerCompletion)completion;

/** 更新用户信息 */
- (void)updateUserInfoCompletion:(UserManagerCompletion)completion;

@end




































