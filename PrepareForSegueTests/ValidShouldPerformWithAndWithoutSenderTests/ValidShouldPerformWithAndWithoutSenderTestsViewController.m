//
//  ValidShouldPerformWithAndWithoutSenderTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidShouldPerformWithAndWithoutSenderTestsViewController.h"

@implementation ValidShouldPerformWithAndWithoutSenderTestsViewController

- (BOOL)shouldPerformTesting {
    _shouldPerformMethodWithoutSenderWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformTestingWithSender:(id)sender {
    _shouldPerformMethodWithSenderWasCalled = YES;
    return YES;
}

@end
