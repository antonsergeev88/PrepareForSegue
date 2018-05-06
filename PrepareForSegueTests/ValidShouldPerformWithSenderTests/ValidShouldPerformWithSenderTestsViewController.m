//
//  ValidShouldPerformWithSenderTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidShouldPerformWithSenderTestsViewController.h"

@implementation ValidShouldPerformWithSenderTestsViewController

- (BOOL)shouldPerformTestingWithSender:(id)sender {
    _shouldPerformMethodWasCalled = YES;
    return YES;
}

@end
