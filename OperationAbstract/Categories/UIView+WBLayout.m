//
//  UIView+WBLayout.m
//  ProjectLaunched
//
//  Created by Delpan on 2017/11/7.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "UIView+WBLayout.h"

@implementation UIView (WBLayout)

- (CGFloat)wb_left
{
    return self.frame.origin.x;
}

- (void)setWb_left:(CGFloat)wb_left
{
    CGRect frame = self.frame;
    frame.origin.x = wb_left;
    self.frame = frame;
}

- (CGFloat)wb_top
{
    return self.frame.origin.y;
}

- (void)setWb_top:(CGFloat)wb_top
{
    CGRect frame = self.frame;
    frame.origin.y = wb_top;
    self.frame = frame;
}

- (CGFloat)wb_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setWb_right:(CGFloat)wb_right
{
    CGRect frame = self.frame;
    frame.origin.x = wb_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)wb_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setWb_bottom:(CGFloat)wb_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = wb_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)wb_width
{
    return self.frame.size.width;
}

- (void)setWb_width:(CGFloat)wb_width
{
    CGRect frame = self.frame;
    frame.size.width = wb_width;
    self.frame = frame;
}

- (CGFloat)wb_height
{
    return self.frame.size.height;
}

- (void)setWb_height:(CGFloat)wb_height
{
    CGRect frame = self.frame;
    frame.size.height = wb_height;
    self.frame = frame;
}

- (CGFloat)wb_centerX
{
    return self.center.x;
}

- (void)setWb_centerX:(CGFloat)wb_centerX
{
    self.center = CGPointMake(wb_centerX, self.center.y);
}

- (CGFloat)wb_centerY
{
    return self.center.y;
}

- (void)setWb_centerY:(CGFloat)wb_centerY
{
    self.center = CGPointMake(self.center.x, wb_centerY);
}

- (CGPoint)wb_origin
{
    return self.frame.origin;
}

- (void)setWb_origin:(CGPoint)wb_origin
{
    CGRect frame = self.frame;
    frame.origin = wb_origin;
    self.frame = frame;
}

- (CGSize)wb_size
{
    return self.frame.size;
}

- (void)setWb_size:(CGSize)wb_size
{
    CGRect frame = self.frame;
    frame.size = wb_size;
    self.frame = frame;
}

@end
























