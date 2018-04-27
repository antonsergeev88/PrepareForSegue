//
//  InvalidShouldPerformTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InvalidShouldPerformTestsViewController.h"

@interface InvalidShouldPerformTests : XCTestCase {
    InvalidShouldPerformTestsViewController *_sourceViewController;
}

@end

@implementation InvalidShouldPerformTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[InvalidShouldPerformTestsViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    [super tearDown];
}

- (void)testNotCallingShouldPerformSegueWithNoReturnValue {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithPointerReturnValue {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithPointerReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithObjectReturnValue {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithObjectReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
}

@end
