//
//  WBCache.m
//  NormalProject
//
//  Created by Delpan on 2017/11/21.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "WBCache.h"

@implementation WBCache

#pragma mark - Life cycle
+ (instancetype)shareCache
{
    static WBCache *cache = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        cache = [WBCache new];
    });
    
    return cache;
}

#pragma mark - Public Methods
- (void)storeData:(NSData *)data forKey:(NSString *)key async:(BOOL)async
{
    
}

- (void)dataForKey:(NSString *)key async:(BOOL)async completion:(void (^)(NSData *, NSString *))completion
{
    !completion ?: completion(nil, key);
}

@end































