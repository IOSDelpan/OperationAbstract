//
//  LaunchMainContentOperation.h
//  OperationAbstract
//
//  Created by Delpan on 2017/11/29.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "WBBaseOperation.h"
#import <UIKit/UIWindow.h>

@interface LaunchMainContentOperation : WBBaseOperation

- (instancetype)initWithWindow:(__strong UIWindow **)window;

@end
