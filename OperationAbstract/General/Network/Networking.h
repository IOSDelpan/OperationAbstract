//
//  Networking.h
//  NormalProject
//
//  Created by Delpan on 2017/11/16.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Networking : NSObject

+ (instancetype)shareNetworking;

/**
 *  网络配置，通常为了可以适配各个项目，配置工作或配置信息由配置对象提供，通过提供不同的配置对象完成配置操作的，
 *  本Demo只是为了简单的说明事件，所以直接这样处理了
 */
- (void)configCompletion:(void (^)(BOOL success))completion;

@end












































