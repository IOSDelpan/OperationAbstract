//
//  LaunchViewController.m
//  NormalProject
//
//  Created by Delpan on 2017/11/21.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "LaunchViewController.h"

#import "SettingManager.h"
#import "UIView+WBLayout.h"

@interface LaunchViewController ()

@property (nonatomic, strong) UIImageView *launchView;
@property (nonatomic, strong) UILabel *launchLabel;

@end

@implementation LaunchViewController

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.launchView.image = [[SettingManager shareManager] launchImage];
    
    [self.view addSubview:self.launchView];
    [self.view addSubview:self.launchLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.35f animations:^{
            
            _launchWindow.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            _launchWindow = nil;
        }];
    });
}

#pragma mark - Get
- (UIImageView *)launchView
{
    if (!_launchView)
    {
        _launchView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        _launchView.backgroundColor = [UIColor blackColor];
        _launchView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _launchView;
}

- (UILabel *)launchLabel
{
    if (!_launchLabel)
    {
        _launchLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
        _launchLabel.textColor = [UIColor lightGrayColor];
        _launchLabel.text = @"Launching...";
        _launchLabel.textAlignment = NSTextAlignmentCenter;
        _launchLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return _launchLabel;
}

@end




































