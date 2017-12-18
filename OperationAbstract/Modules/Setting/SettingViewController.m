//
//  SettingViewController.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "SettingViewController.h"

#import "UserManager.h"
#import "TransitionManager.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Setting";
}

#pragma mark - Template Sub Methods
- (NSArray *)_buttonTitles
{
    return ([[UserManager shareManager] currentState] == UserStateLogin) ? @[ @"退出登录" ] : nil;
}

- (SEL)_buttonSelectorForIndex:(NSUInteger)index
{
    return @selector(logoutButtonAction:);
}

#pragma mark - Evenr Response
- (void)logoutButtonAction:(UIButton *)sender
{
    [[UserManager shareManager] logoutCompletion:^(BOOL success) {
        
        [TransitionManager popViewControllerAnimated:YES];
    }];
}

@end
































