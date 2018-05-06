//
//  ValidPrepareAndInvalidPrepareWithSenderTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidPrepareAndInvalidPrepareWithSenderTestsViewController.h"

@implementation ValidPrepareAndInvalidPrepareWithSenderTestsViewController

- (void)prepareForScalarSender {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (void)prepareForScalarSenderWithSender:(BOOL)sender {
    _prepareMethodWithSenderWasCalled = YES;
}

- (void)prepareForPointerSender {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (void)prepareForPointerSenderWithSender:(void *)sender {
    _prepareMethodWithSenderWasCalled = YES;
}

- (void)prepareForScalarReturn {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (BOOL)prepareForScalarReturnWithSender:(id)sender {
    _prepareMethodWithSenderWasCalled = YES;
    return YES;
}

- (void)prepareForPointerReturn {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (void *)prepareForPointerReturnWithSender:(id)sender {
    _prepareMethodWithSenderWasCalled = YES;
    return (__bridge void *)(self);
}

- (void)prepareForObjectReturn {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (id)prepareForObjectReturnWithSender:(id)sender {
    _prepareMethodWithSenderWasCalled = YES;
    return self;
}

@end
