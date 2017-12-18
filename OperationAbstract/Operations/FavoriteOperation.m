//
//  FavoriteOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/14.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "FavoriteOperation.h"
#import "UserManager.h"

@implementation FavoriteOperation

#pragma mark - Template Sub Methods
- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
      
        self.executing = YES;
        
        if ([[UserManager shareManager] currentState] == UserStateLogin)
        {
            NSLog(@"收藏成功");
        }
        
        self.finished = YES;
        self.executing = NO;
    };
}

@end

































