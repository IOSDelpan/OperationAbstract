//
//  TransitionManager.h
//  ProjectLaunched
//
//  Created by Delpan on 2015/10/9.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionManager : NSObject

/** @brief 获取当前的导航栏控制器
 *
 * @return 当前导航栏控制器
 */
+ (UINavigationController *)currentNavigationController;

/** @brief 导航Push到下一个页面
 *
 * @param viewControllerName 视图控制器名称
 * @param animated 是否需要动画
 * @param parameters 基本参数
 */
+ (void)pushViewControllerName:(NSString *)viewControllerName
                      animated:(BOOL)animated
                    parameters:(NSDictionary *)parameters;

/** @brief 导航返回到上一个页面
 *
 * @param animated 是否需要动画
 */
+ (void)popViewControllerAnimated:(BOOL)animated;

/** @brief 导航返回到指定页面
 *
 * @param viewControllerName 视图控制器名称
 * @param animated 是否需要动画
 */
+ (void)popToViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated;

/** @brief 导航返回根页面
 *
 * @param animated 是否需要动画
 */
+ (void)popToRootViewControllerAnimated:(BOOL)animated;

/** @brief 模态跳转到下一个页面
 *
 * @param viewControllerName 视图控制器名称
 * @param animated 是否需要动画
 * @param needNavigation 是否需要导航
 * @param parameters 基本参数
 * @param completion 操作完成回调
 */
+ (void)presentViewControllerName:(NSString *)viewControllerName
                         animated:(BOOL)animated
                   needNavigation:(BOOL)needNavigation
                       parameters:(NSDictionary *)parameters
                       completion:(void (^)(void))completion;

/** @brief 模态返回到上一个页面
 *
 * @param animated 是否需要动画
 * @param completion 操作完成回调
 */
+ (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

/** @brief 模态返回到根页面
 *
 * @param animated 是否需要动画
 * @param completion 操作完成回调
 */
+ (void)dismissToRootViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

/** @brief 以前一次过渡的方式返回
 *
 * @param animated 是否需要动画
 * @param completion 操作完成回调
 */
+ (void)mementoBackViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;

@end



@interface TransitionManager (TransitionManagerConfigure)

/** 根视图控制器 */
@property (nonatomic, strong, class) UIViewController *rootViewController;
/** 导航控制器类 */
@property (nonatomic, strong, class) Class navigationControllerClass;

@end























