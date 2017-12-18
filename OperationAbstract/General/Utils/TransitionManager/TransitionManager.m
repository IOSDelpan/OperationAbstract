//
//  TransitionManager.m
//  ProjectLaunched
//
//  Created by Delpan on 2015/10/9.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "TransitionManager.h"
#import <objc/runtime.h>
#import "TransitionManagerStack.h"

typedef NSString *_TransitionType;
static _TransitionType const _TransitionTypePush = @"TransitionTypePush";
static _TransitionType const _TransitionTypePresent = @"TransitionTypePresent";

static char const _TransitionManagerRootViewController;
static char const _TransitionManagerNavigationControllerClass;
static char const _TransitionManagerStack;
static char const _TransitionManagerCurrentTransitionType;

@implementation TransitionManager

#pragma mark - Public Methods
#pragma mark -获取当前的导航栏控制器
+ (UINavigationController *)currentNavigationController
{
    UINavigationController *navigationController = nil;
    UIViewController *controller = self.stack.stackTopViewController;
    
    if ([controller isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabController = (UITabBarController *)controller;
        navigationController = tabController.selectedViewController;
    }
    else if ([controller isKindOfClass:[UINavigationController class]])
    {
        navigationController = (UINavigationController *)controller;
    }
    else
    {
        navigationController = controller.navigationController;
    }
    
    return navigationController;
}

#pragma mark -导航Push到下一个页面
+ (void)pushViewControllerName:(NSString *)viewControllerName
                      animated:(BOOL)animated
                    parameters:(NSDictionary *)parameters
{
    UIViewController *viewController = [self _controllerWithName:viewControllerName parameters:parameters];
    
    if (viewController)
    {
        UINavigationController *navigationController = [self currentNavigationController];
        
        if (navigationController)
        {
            self.currentTransitionType = _TransitionTypePush;
            [navigationController pushViewController:viewController animated:animated];
        }
    }
}

#pragma mark -导航返回到上一个页面
+ (void)popViewControllerAnimated:(BOOL)animated
{
    [[self currentNavigationController] popViewControllerAnimated:animated];
}

#pragma mark -导航返回到指定页面
+ (void)popToViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated
{
    UINavigationController *navigationController = [self currentNavigationController];
    
    for (UIViewController *controller in navigationController.viewControllers)
    {
        if ([NSStringFromClass(controller.class) isEqualToString:viewControllerName])
        {
            [navigationController popToViewController:controller animated:animated];
            break;
        }
    }
}

#pragma mark -导航返回根页面
+ (void)popToRootViewControllerAnimated:(BOOL)animated
{
    [[self currentNavigationController] popToRootViewControllerAnimated:animated];
}

#pragma mark -模态跳转到下一个页面
+ (void)presentViewControllerName:(NSString *)viewControllerName
                         animated:(BOOL)animated
                   needNavigation:(BOOL)needNavigation
                       parameters:(NSDictionary *)parameters
                       completion:(void (^)(void))completion
{
    UIViewController *viewController = [self _controllerWithName:viewControllerName parameters:parameters];
    
    if (viewController)
    {
        UIViewController *appearViewController = viewController;
        
        if (needNavigation)
        {
            appearViewController = [[self navigationControllerClass] new];
            [(UINavigationController *)appearViewController pushViewController:viewController animated:NO];
        }
        
        UIViewController *disappearViewController = self.stack.stackTopViewController;
        [disappearViewController presentViewController:appearViewController animated:animated completion:^{
            
            !completion ?: completion();
            self.currentTransitionType = _TransitionTypePresent;
            [self.stack pushViewController:appearViewController];
        }];
    }
}

#pragma mark -模态返回到上一个页面
+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    if (self.stack.size > 1)
    {
        [self.stack popViewController];
        
        UIViewController *appearViewController = self.stack.stackTopViewController;
        [appearViewController dismissViewControllerAnimated:animated completion:completion];
    }
}

#pragma mark -模态返回到根页面
+ (void)dismissToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    [self.stack popAllViewControllers];
    [self.stack pushViewController:self.rootViewController];
    
    UIViewController *appearViewController = self.stack.stackTopViewController;
    [appearViewController dismissViewControllerAnimated:animated completion:completion];
}

#pragma mark -以前一次过渡的方式返回
+ (void)mementoBackViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    if ([self.currentTransitionType isEqualToString:_TransitionTypePush])
    {
        [self popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:completion];
    }
}

#pragma mark - Private Methods
#pragma mark -创建视图控制器
+ (UIViewController *)_controllerWithName:(NSString *)name parameters:(NSDictionary *)parameters
{
    UIViewController *controller = (name.length > 0) ? [NSClassFromString(name) new] : nil;
    !parameters ?: [controller setValuesForKeysWithDictionary:parameters];
    return controller;
}

#pragma mark - Set / Get
#pragma mark -视图控制器栈
+ (TransitionManagerStack *)stack
{
    TransitionManagerStack *stack = objc_getAssociatedObject(self, &_TransitionManagerStack);
    
    if (!stack)
    {
        stack = [TransitionManagerStack new];
        objc_setAssociatedObject(self, &_TransitionManagerStack, stack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return stack;
}

+ (void)setCurrentTransitionType:(_TransitionType)currentTransitionType
{
    objc_setAssociatedObject(self, &_TransitionManagerCurrentTransitionType, currentTransitionType, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

+ (_TransitionType)currentTransitionType
{
    return objc_getAssociatedObject(self, &_TransitionManagerCurrentTransitionType);
}

@end



@implementation TransitionManager (TransitionManagerConfigure)

#pragma mark - Set / Get
#pragma mark -根视图控制器
+ (void)setRootViewController:(UIViewController *)rootViewController
{
    [self.stack popAllViewControllers];
    [self.stack pushViewController:rootViewController];
    
    objc_setAssociatedObject(self, &_TransitionManagerRootViewController, rootViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (UIViewController *)rootViewController
{
    return objc_getAssociatedObject(self, &_TransitionManagerRootViewController);
}

#pragma mark -导航控制器类
+ (void)setNavigationControllerClass:(Class)navigationControllerClass
{
    objc_setAssociatedObject(self, &_TransitionManagerNavigationControllerClass, navigationControllerClass, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (Class)navigationControllerClass
{
    return objc_getAssociatedObject(self, &_TransitionManagerNavigationControllerClass);
}

@end
























