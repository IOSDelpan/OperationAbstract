//
//  AlertOperation.h
//  OperationAbstract
//
//  Created by Delpan on 2017/11/22.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "WBBaseOperation.h"
#import <UIKit/UIViewController.h>

typedef NS_ENUM(NSUInteger, AlertOperationStyle)
{
    AlertOperationTypeAlert = 0,
    AlertOperationTypeTextField = 1,
    AlertOperationTypeActionSheet = 2
};

@interface AlertOperation : WBBaseOperation

+ (instancetype)alertOperationWithTitle:(NSString *)title
                                message:(NSString *)message
                                  style:(AlertOperationStyle)style;

/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 内容 */
@property (nonatomic, copy) NSString *message;

/** 取消按钮标题 */
@property (nonatomic, copy) NSString *cancelButtonTitle;
/** 取消按钮标题颜色 */
@property (nonatomic, copy) UIColor *cancelButtonTitleColor;

/** 其它按钮标题 */
@property (nonatomic, copy) NSArray<NSString *> *otherButtonTitles;
/** 其它按钮标题颜色 */
@property (nonatomic, copy) NSArray<UIColor *> *otherButtonTitleColors;

/** 用于跳转的Controller */
@property (nonatomic, weak) UIViewController *presentController;

/** 按钮触发回调 */
@property (nonatomic, copy) void (^actionButtonClicked)(NSString *actionTitle);

/** 所有已添加的textField */
@property (nonatomic, readonly) NSArray<UITextField *> *textFields;

/** 添加textField */
- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler;

@end







































