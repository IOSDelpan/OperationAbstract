//
//  BaseOperation.h
//  OperationQueueProject
//
//  Created by Delpan on 2017/11/2.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *WBBaseOperationType;
extern WBBaseOperationType const kWBBaseOperationTypeSingleton;
extern WBBaseOperationType const kWBBaseOperationTypeSerial;
extern WBBaseOperationType const kWBBaseOperationTypeConcurrent;

typedef void (^WBBaseOperationEmptyBlock)(void);

@interface WBBaseOperation : NSOperation

@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;

@end


















