//
//  InvalidShouldPerformTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "InvalidShouldPerformTestsViewController.h"

@implementation InvalidShouldPerformTestsViewController

- (void)shouldPerformTestingWithNoReturnValue {
    _shouldPerformMethodWasCalled = YES;
}

- (void *)shouldPerformTestingWithPointerReturnValue {
    _shouldPerformMethodWasCalled = YES;
    return (__bridge void *)(self);
}

- (id)shouldPerformTestingWithObjectReturnValue {
    _shouldPerformMethodWasCalled = YES;
    return self;
}

- (BOOL)shouldPerform {
    _shouldPerformMethodWasCalled = YES;
    return YES;
}

@end
