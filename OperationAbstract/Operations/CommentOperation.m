//
//  CommentOperation.m
//  OperationAbstract
//
//  Created by Delpan on 2017/11/14.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "CommentOperation.h"
#import "UserManager.h"

@implementation CommentOperation

#pragma mark - Template Sub Methods
- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return ^{
      
        self.executing = YES;
        
        if ([[UserManager shareManager] currentState] == UserStateLogin)
        {
            NSLog(@"%@", _comment);
        }
        
        self.finished = YES;
        self.executing = NO;
    };
}

@end



















