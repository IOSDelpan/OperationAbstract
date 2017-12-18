//
//  NSOperation+WBOperationAbstract.h
//  OperationAbstract
//
//  Created by Delpan on 2017/11/14.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSOperation (WBOperationStart)

- (void)syncStart;
- (void)asyncStart;

- (void)startAfterOperations:(NSOperation *)newOperation, ...;

@end



@interface NSOperationQueue (WBOperationDispatchManager)

/** 立即执行Operation */
+ (void)syncStartOperations:(NSOperation *)newOperation, ...;

/** 并发或异步执行Operation */
+ (void)asyncStartOperations:(NSOperation *)newOperation, ...;

@end


































