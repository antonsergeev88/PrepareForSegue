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

- (void)testNotCallingShouldPerformSegueWithNoReturnValuePerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoReturnValue"
                                                               sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingShouldPerformSegueWithPointerReturnValue {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithPointerReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithPointerReturnValuePerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithPointerReturnValue"
                                                               sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingShouldPerformSegueWithObjectReturnValue {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithObjectReturnValue"
                                                     sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithObjectReturnValuePerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithObjectReturnValue"
                                                               sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingShouldPerformSegueWithNoMethodForSelector {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoMethodForSelector"
                                                                               sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithNoMethodForSelectorPerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@"TestingWithNoMethodForSelector"
                                                               sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingShouldPerformSegueWithEmptyIdentifier {
    BOOL shouldPerformSegue = [_sourceViewController shouldPerformSegueWithIdentifier:@""
                                                                               sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
    XCTAssertTrue(shouldPerformSegue);
}

- (void)testNotCallingShouldPerformSegueWithEmptyIdentifierPerformance {
    [self measureBlock:^{
        [self->_sourceViewController shouldPerformSegueWithIdentifier:@""
                                                               sender:self->_sourceViewController];
    }];
}

@end
