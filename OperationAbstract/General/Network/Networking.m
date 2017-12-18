//
//  Networking.m
//  NormalProject
//
//  Created by Delpan on 2017/11/16.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "Networking.h"

@implementation Networking

#pragma mark - Life Cycle
+ (instancetype)shareNetworking
{
    return (Networking *)self;
}

#pragma mark - Public Methods
+ (void)configCompletion:(void (^)(BOOL success))completion
{
    !completion ?: completion(YES);
}

@end



































