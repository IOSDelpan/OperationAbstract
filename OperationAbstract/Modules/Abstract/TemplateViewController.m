//
//  TemplateViewController.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/8.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "TemplateViewController.h"

#import "UIView+WBLayout.h"
#import "TransitionManager.h"

@interface TemplateViewController ()

@end

@implementation TemplateViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self __initContentViews];
    [self __initNavigationBarBackButton];
}

#pragma mark -Template Method
- (void)__initContentViews
{
    NSArray *buttonTitles = [self _buttonTitles];
    CGSize buttonSize = CGSizeMake(150.f, 35.f);
    CGFloat distance = 30.f;
    
    for (int i = 0; i < buttonTitles.count; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0, 150.f + (distance + buttonSize.height) * i, buttonSize.width, buttonSize.height);
        button.wb_centerX = self.view.wb_width * 0.5f;
        button.layer.cornerRadius = 4.f;
        button.layer.borderWidth = 0.5f;
        button.layer.borderColor = button.titleLabel.textColor.CGColor;
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [button addTarget:self
                   action:[self _buttonSelectorForIndex:i]
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (NSArray *)_buttonTitles
{
    return nil;
}

- (SEL)_buttonSelectorForIndex:(NSUInteger)index
{
    return NULL;
}

#pragma mark - Private Methods
- (void)__initNavigationBarBackButton
{
    if (self.navigationController.childViewControllers.count > 1)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                 style:UIBarButtonItemStylePlain
                                                                                target:self
                                                                                action:@selector(backButtonAction:)];
    }
}

#pragma mark - Event Reponse
- (void)backButtonAction:(UIBarButtonItem *)sender
{
    [TransitionManager popViewControllerAnimated:YES];
}

@end





























