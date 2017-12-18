//
//  MainViewController.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "MainViewController.h"

#import "TransitionManager.h"

#import "AlertOperation.h"
#import "LoginOperation.h"
#import "FavoriteOperation.h"
#import "CommentOperation.h"
#import "NSOperation+WBOperation.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _initViews];
}

#pragma mark - Template Sub Methods
- (NSArray *)_buttonTitles
{
    return @[ @"收藏", @"评论", @"Alert" ];
}

- (SEL)_buttonSelectorForIndex:(NSUInteger)index
{
    SEL selectors[] = { @selector(favoriteButtonAction:), @selector(commentButtonAction:), @selector(alertButtonAction:) };
    return selectors[index];
}

#pragma mark - Private Methods
- (void)_initViews
{
    [self _initRightBarButton];
}

#pragma mark --Right Bar Button
- (void)_initRightBarButton
{
    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    settingButton.bounds = CGRectMake(0, 0, 40.f, 25.f);
    [settingButton setTitle:@"设置" forState:UIControlStateNormal];
    [settingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(settingButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingButton];
}

#pragma mark - Event Response
- (void)settingButtonAction:(UIButton *)sender
{
    [TransitionManager pushViewControllerName:@"SettingViewController" animated:YES parameters:nil];
}

- (void)favoriteButtonAction:(UIButton *)sender
{
    LoginOperation *loginOperation = [LoginOperation new];
    
    FavoriteOperation *favoriteOperation = [FavoriteOperation new];
    [favoriteOperation startAfterOperations:loginOperation, nil];
    
    [NSOperationQueue asyncStartOperations:loginOperation, favoriteOperation, nil];
}

- (void)commentButtonAction:(UIButton *)sender
{
    LoginOperation *loginOperation = [LoginOperation new];
    
    CommentOperation *commentOperation = [CommentOperation new];
    commentOperation.comment = @"BELI BALA BELI BALA";
    [commentOperation startAfterOperations:loginOperation, nil];
    
    [NSOperationQueue asyncStartOperations:loginOperation, commentOperation, nil];
}

- (void)alertButtonAction:(UIButton *)sender
{
    for (u_int8_t i = 0; i < 4; i++)
    {
        AlertOperationStyle style = (i % 2 == 0) ? AlertOperationTypeAlert : AlertOperationTypeActionSheet;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * i * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            AlertOperation *operation = [AlertOperation alertOperationWithTitle:@"问题天天都多"
                                                                        message:@"BELI BALA BELI BALA　不惊会跌倒 \n BELI BALA BELI BALA　爸妈当我宝 \n BELI BALA BELI BALA　天天身体会增高"
                                                                          style:style];
            operation.cancelButtonTitle = @"取消";
            operation.otherButtonTitles = @[ @"确定" ];
            operation.presentController = [TransitionManager currentNavigationController];
            operation.actionButtonClicked = ^(NSString *actionTitle) {
              
                NSLog(@"%@", actionTitle);
            };
            [operation asyncStart];
        });
    }
}

@end































