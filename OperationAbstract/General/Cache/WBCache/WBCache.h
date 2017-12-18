//
//  WBCache.h
//  NormalProject
//
//  Created by Delpan on 2017/11/21.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBCache : NSObject

+ (instancetype)shareCache;

@property NSUInteger totalCostLimit;
@property NSUInteger countLimit;

- (void)storeData:(NSData *)data forKey:(NSString *)key async:(BOOL)async;
- (void)dataForKey:(NSString *)key async:(BOOL)async completion:(void (^)(NSData *data, NSString *key))completion;

@end
