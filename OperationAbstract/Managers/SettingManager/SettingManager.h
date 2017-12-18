//
//  SettingManager.h
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingManager : NSObject

+ (instancetype)shareManager;

/** 检测版本 */
- (void)versionCheckedCompletion:(void (^)(NSString *message))completion;
/** 更新用户设置 */
- (void)updateSettingCompletion:(void (^)(BOOL success))completion;

/** 获取启动面资源 */
- (UIImage *)launchImage;

@end


































