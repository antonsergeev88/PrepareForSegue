//
//  InvalidPrepareTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "InvalidPrepareTestsViewController.h"

@implementation InvalidPrepareTestsViewController

- (BOOL)prepareForTestingWithScalarReturnValue {
    _prepareMethodWasCalled = YES;
    return YES;
}

- (void *)prepareForTestingWithPointerReturnValue {
    _prepareMethodWasCalled = YES;
    return (__bridge void *)(self);
}

- (id)prepareForTestingWithObjectReturnValue {
    _prepareMethodWasCalled = YES;
    return self;
}

@end
