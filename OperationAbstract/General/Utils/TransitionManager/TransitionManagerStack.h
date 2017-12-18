//
//  TransitionManagerStack.h
//  ProjectLaunched
//
//  Created by Delpan on 2015/10/9.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionManagerStack : NSObject

- (void)pushViewController:(UIViewController *)viewController;

- (void)popViewController;
- (void)popAllViewControllers;

- (NSUInteger)size;
- (UIViewController *)stackTopViewController;
- (NSArray<UIViewController *> *)viewControllers;

@end



























