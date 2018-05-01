//
//  OverridingImplementationTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 30.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "OverridingImplementationTestsViewController.h"

@implementation OverridingImplementationTestsViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    _overridedPrepareMethodWasCalled = YES;
}

- (void)prepareForTesting {
    _prepareMethodWasCalled = YES;
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    _overridedShouldPerformMethodWasCalled = YES;
    return YES;
}

- (BOOL)shouldPerformTesting {
    _shouldPerformMethodWasCalled = YES;
    return YES;
}

@end
