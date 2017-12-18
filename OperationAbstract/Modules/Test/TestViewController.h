//
//  TestViewController.h
//  NormalProject
//
//  Created by Delpan on 2017/11/17.
//  Copyright © 2017年 Delpan. All rights reserved.
//

#import "TemplateViewController.h"
#import "OperationHookInterface.h"

@interface TestViewController : TemplateViewController

@property (nonatomic, weak) id <DelegateHookInterface> hookDelegate;

@end
