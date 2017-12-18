//
//  InfoCollectedManager.m
//  NormalProject
//
//  Created by Delpan on 2017/11/16.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "InfoCollectedManager.h"

@implementation InfoCollectedManager

#pragma mark - Life Cycle
+ (instancetype)shareManager
{
    return (InfoCollectedManager *)self;
}

#pragma mark - Public Methods
+ (void)start
{
    NSLog(@"开始收集信息");
}

@end




































