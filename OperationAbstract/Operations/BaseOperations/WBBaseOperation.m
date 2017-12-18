//
//  BaseOperation.m
//  OperationQueueProject
//
//  Created by Delpan on 2017/11/2.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "WBBaseOperation.h"
#import <pthread/pthread.h>

WBBaseOperationType const kWBBaseOperationTypeSingleton = @"WBBaseOperationTypeSingleton";
WBBaseOperationType const kWBBaseOperationTypeSerial = @"WBBaseOperationTypeSerial";
WBBaseOperationType const kWBBaseOperationTypeConcurrent = @"WBBaseOperationTypeConcurrent";

/** 公共的OperationQueue */
static NSOperationQueue *_WBOperationManagerQueue(WBBaseOperationType type)
{
    static NSMutableDictionary *queues = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        queues = [NSMutableDictionary dictionary];
    });
    
    NSOperationQueue *queue = queues[type];
    
    if (!queue)
    {
        queue = [NSOperationQueue new];
        queue.name = type;
        queues[type] = queue;
    }
    
    return queue;
}

@implementation WBBaseOperation

@synthesize executing = _executing;
@synthesize finished = _finished;

#pragma mark - Template Sub Methods
+ (NSOperationQueue *)_queueForOperation:(NSOperation *)newOperation
{
    WBBaseOperationType operationType = [self _operationType];
    NSOperationQueue *queue = _WBOperationManagerQueue(operationType);
    
    if (operationType == kWBBaseOperationTypeSingleton)
    {
        for (NSOperation *operation in [queue operations])
        {
            if ([operation isMemberOfClass:self])
            {
                queue = nil;
                break;
            }
        }
    }
    else if (operationType == kWBBaseOperationTypeSerial)
    {
        [queue.operations enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if ([obj isMemberOfClass:self])
            {
                [newOperation addDependency:(NSOperation *)obj];
                *stop = YES;
            }
        }];
    }
    
    return queue;
}

+ (WBBaseOperationType)_operationType
{
    return kWBBaseOperationTypeConcurrent;
}

#pragma mark - Pubilc Methods
- (void)start
{
    if ([self isCancelled])
    {
        self.finished = YES;
        return;
    }
    
    WBBaseOperationEmptyBlock block = [self _startOnMainQueue];
    
    if (block)
    {
        pthread_main_np() ? block() : dispatch_async(dispatch_get_main_queue(), block);
    }
    else
    {
        block = [self _startOnCurrentQueue];
        !block ?: block();
    }
}

- (void)cancel
{
    [super cancel];
    self.finished = YES;
    self.executing = NO;
}

#pragma mark - Private Methods
- (WBBaseOperationEmptyBlock)_startOnMainQueue
{
    return nil;
}

- (WBBaseOperationEmptyBlock)_startOnCurrentQueue
{
    return nil;
}

#pragma mark - Set
- (void)setFinished:(BOOL)finished
{
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing
{
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

@end






















