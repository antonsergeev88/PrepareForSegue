//
//  ValidShouldPerformTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidShouldPerformTestsViewController.h"

@implementation ValidShouldPerformTestsViewController

- (BOOL)shouldPerformTesting {
    _shouldPerformMethodWasCalled = YES;
    return YES;
}

@end
