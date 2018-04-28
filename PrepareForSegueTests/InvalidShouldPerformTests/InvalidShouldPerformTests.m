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
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithPointerReturnValue {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithPointerReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithObjectReturnValue {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithObjectReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithNoMethodForSelector {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoMethodForSelector"
                                                                               sender:_sourceViewController];
    XCTAssertTrue(shouldPerformSegue);
}

@end
