//
//  TestViewController.m
//  NormalProject
//
//  Created by Delpan on 2017/11/17.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "TestViewController.h"

#import "UserManager.h"
#import "TransitionManager.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Template Sub Methods
- (NSArray *)_buttonTitles
{
    return @[ @"测试" ];
}

- (SEL)_buttonSelectorForIndex:(NSUInteger)index
{
    return @selector(testButtonAction:);
}

- (void)_buttonAction
{
    if (![_hookDelegate delegateDidHandle])
    {
        [TransitionManager popViewControllerAnimated:YES];
    }
}

#pragma mark - Event Response
- (void)testButtonAction:(UIButton *)sender
{
    [[UserManager shareManager] setTestFinished:YES];
    [self _buttonAction];
}

- (void)backButtonAction:(UIBarButtonItem *)sender
{
    [self _buttonAction];
}

@end




























