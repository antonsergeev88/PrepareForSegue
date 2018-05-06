//
//  ValidShouldPerformWithAndWithoutSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidShouldPerformWithAndWithoutSenderTestsViewController.h"

@interface ValidShouldPerformWithAndWithoutSenderTests : XCTestCase {
    ValidShouldPerformWithAndWithoutSenderTestsViewController *_sourceViewController;
}

@end

@implementation ValidShouldPerformWithAndWithoutSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidShouldPerformWithAndWithoutSenderTestsViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    [super tearDown];
}

- (void)testCallingShouldPerformSegueWithSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithoutSenderWasCalled);
}

@end
