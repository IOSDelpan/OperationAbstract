//
//  AlertOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/22.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "AlertOperation.h"
#import <UIKit/UIAlertController.h>
#import "UIAlertAction+WBRendering.h"

@interface AlertOperation ()

@property (nonatomic, assign) AlertOperationStyle style;
@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation AlertOperation

#pragma mark - Factory
+ (instancetype)alertOperationWithTitle:(NSString *)title
                                message:(NSString *)message
                                  style:(AlertOperationStyle)style
{
    UIAlertControllerStyle styles[] = { UIAlertControllerStyleAlert, UIAlertControllerStyleAlert, UIAlertControllerStyleActionSheet };
    
    AlertOperation *operation = [AlertOperation new];
    operation.title = title;
    operation.message = message;
    operation.style = style;
    operation.alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:styles[style]];
    return operation;
}

#pragma mark - Template Sub Methods
+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeSerial;
}

- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
        
        self.executing = YES;
        
        __weak AlertOperation *operation = self;
        _alertController.title = _title;
        _alertController.message = _message;
        
        void (^block)(NSString *title) = ^(NSString *title){
            
            !operation.actionButtonClicked ?: operation.actionButtonClicked(title);
            operation.finished = YES;
            operation.executing = NO;
        };
        
        // Cancel button
        [self _addActionWithTitle:_cancelButtonTitle
                       titleColor:_cancelButtonTitleColor
                            style:UIAlertActionStyleCancel
                       completion:block];
        
        // Other button
        u_int8_t titleCount = _otherButtonTitles.count;
        u_int8_t colorCount = _otherButtonTitleColors.count;
        
        if (titleCount > 0)
        {
            for (u_int8_t i = 0; i < titleCount; i++)
            {
                NSString *title = _otherButtonTitles[i];
                UIColor *titleColor = (i < colorCount) ? _otherButtonTitleColors[i] : [_otherButtonTitleColors lastObject];
                
                [self _addActionWithTitle:title
                               titleColor:titleColor
                                    style:UIAlertActionStyleDefault
                               completion:block];
            }
        }
        
        if (_alertController.actions.count > 0)
        {
            [_presentController presentViewController:_alertController animated:YES completion:nil];
        }
    };
}

#pragma mark - Private Methods
- (void)addTextFieldWithConfigurationHandler:(void (^)(UITextField *textField))configurationHandler
{
    if (_style == AlertOperationTypeTextField)
    {
        [_alertController addTextFieldWithConfigurationHandler:configurationHandler];
    }
}

- (void)_addActionWithTitle:(NSString *)title
                 titleColor:(UIColor *)titleColor
                      style:(UIAlertActionStyle)style
                 completion:(void (^)(NSString *title))completion
{
    if (title.length > 0)
    {
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:title style:style handler:^(UIAlertAction * _Nonnull action) {
            
            completion(action.title);
        }];
        
        if (titleColor)
        {
            alertAction.wb_titleColor = titleColor;
        }
        
        [_alertController addAction:alertAction];
    }
}

#pragma mark - Get
- (NSArray<UITextField *> *)textFields
{
    return _alertController.textFields;
}

@end



























