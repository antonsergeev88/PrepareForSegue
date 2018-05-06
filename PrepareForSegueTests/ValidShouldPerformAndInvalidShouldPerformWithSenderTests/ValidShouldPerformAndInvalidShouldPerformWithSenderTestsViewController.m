//
//  ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 07.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController.h"

@implementation ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController

- (BOOL)shouldPerformScalarSender {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformScalarSenderWithSender:(BOOL)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformPointerSender {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformPointerSenderWithSender:(void *)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformVoidReturn {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (void)shouldPerformVoidReturnWithSender:(id)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
}

- (BOOL)shouldPerformPointerReturn {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (void *)shouldPerformPointerReturnWithSender:(id)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
    return (__bridge void *)(self);
}

- (BOOL)shouldPerformObjectReturn {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (id)shouldPerformObjectReturnWithSender:(id)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
    return self;
}

@end
