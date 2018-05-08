//
//  ValidCanTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 08.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidCanTestsViewController.h"

@implementation ValidCanTestsViewController

- (void)test:(UIStoryboardSegue *)sender {}

- (BOOL)canTest {
    _canMethodWasCalled = YES;
    return YES;
}

@end
