//
//  LoginViewController.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/7.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LoginViewController.h"
#import "TestViewController.h"

#import "UserManager.h"
#import "TransitionManager.h"

#import "OperationHookInterface.h"

@interface LoginViewController () <DelegateHookInterface>

@end

@implementation LoginViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录";
}

#pragma mark - Template Sub Methods
- (NSArray *)_buttonTitles
{
    return @[ @"登录", @"取消" ];
}

- (SEL)_buttonSelectorForIndex:(NSUInteger)index
{
    return (index == 0) ? @selector(loginButtonAction:) : @selector(cancelButtonAction:);
}

#pragma mark - Event Response
- (void)loginButtonAction:(UIButton *)sender
{
    __weak UserManager *user = [UserManager shareManager];
    
    [user loginCompletion:^(BOOL success) {
        
        if (user.testFinished)
        {
            [self cancelButtonAction:nil];
        }
        else
        {
            [TransitionManager pushViewControllerName:@"TestViewController" animated:YES parameters:@{ @"hookDelegate" : self }];
        }
    }];
}

- (void)cancelButtonAction:(UIButton *)sender
{
    [_hookDelegate delegateDidHandle];
    [TransitionManager dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Delegate
- (BOOL)delegateDidHandle
{
    [self cancelButtonAction:nil];
    return YES;
}

@end































