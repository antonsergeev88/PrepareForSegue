//
//  ValidPrepareWithAndWithoutSenderTestsViewController.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import "ValidPrepareWithAndWithoutSenderTestsViewController.h"

@interface ValidPrepareWithAndWithoutSenderTestsViewController ()

@end

@implementation ValidPrepareWithAndWithoutSenderTestsViewController

- (void)prepareForTesting {
    _prepareMethodWithoutSenderWasCalled = YES;
}

- (void)prepareForTestingWithSender:(id)sender {
    _prepareMethodWithSenderWasCalled = YES;
}

@end
