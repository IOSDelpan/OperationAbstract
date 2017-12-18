//
//  TransitionManagerStack.m
//  ProjectLaunched
//
//  Created by Delpan on 2015/10/9.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "TransitionManagerStack.h"

@interface TransitionManagerStack ()

@end

@implementation TransitionManagerStack
{
    NSMutableArray *_viewControllers;
}

#pragma mark - Life Cycle
- (instancetype)init
{
    if (self = [super init])
    {
        _viewControllers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Public Methods
- (void)pushViewController:(UIViewController *)viewController
{
    !viewController ?: [_viewControllers addObject:viewController];
}

- (void)popViewController
{
    [_viewControllers removeLastObject];
}

- (void)popAllViewControllers
{
    [_viewControllers removeAllObjects];
}

- (NSUInteger)size
{
    return _viewControllers.count;
}

- (UIViewController *)stackTopViewController
{
    return [_viewControllers lastObject];
}

- (NSArray<UIViewController *> *)viewControllers
{
    return [_viewControllers copy];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"viewControllers = %@", _viewControllers];
}

@end







































