//
//  ValidShouldPerformWithSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidShouldPerformWithSenderTestsViewController.h"

@interface ValidShouldPerformWithSenderTests : XCTestCase {
    ValidShouldPerformWithSenderTestsViewController *_sourceViewController;
}

@end

@implementation ValidShouldPerformWithSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidShouldPerformWithSenderTestsViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    [super tearDown];
}

- (void)testCallingShouldPerformSegue {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertTrue(shouldPerformMethodWasCalled);
}

- (void)testCallingShouldPerformPerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@"Testing"
                                                               sender:self->_sourceViewController];
    }];
}

@end
