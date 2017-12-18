//
//  UIAlertAction+WBRendering.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/24.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UIAlertAction+WBRendering.h"

@implementation UIAlertAction (WBRendering)

- (void)setWb_titleColor:(UIColor *)wb_titleColor
{
    [self setValue:wb_titleColor forKey:@"_titleTextColor"];
}

- (UIColor *)wb_titleColor
{
    return [self valueForKey:@"_titleTextColor"];
}

@end
