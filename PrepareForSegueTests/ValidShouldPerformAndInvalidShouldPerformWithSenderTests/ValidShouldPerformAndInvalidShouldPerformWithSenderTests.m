//
//  ValidShouldPerformAndInvalidShouldPerformWithSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 07.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController.h"

@interface ValidShouldPerformAndInvalidShouldPerformWithSenderTests : XCTestCase {
    ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController *_sourceViewController;
}

@end

@implementation ValidShouldPerformAndInvalidShouldPerformWithSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    [super tearDown];
}

- (void)testNotCallingShouldPerformSegueWithScalarSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"ScalarSender" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutScalarSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"ScalarSender" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithoutSenderWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithPointerSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"PointerSender" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutPointerSender {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"PointerSender" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithoutSenderWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithVoidReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"VoidReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutVoidReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"VoidReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithoutSenderWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithPointerReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"PointerReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutPointerReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"PointerReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithoutSenderWasCalled);
}

- (void)testNotCallingShouldPerformSegueWithObjectReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"ObjectReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithSenderWasCalled = _sourceViewController.shouldPerformMethodWithSenderWasCalled;
    XCTAssertFalse(shouldPerformMethodWithSenderWasCalled);
}

- (void)testCallingShouldPerformSegueWithoutObjectReturn {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"ObjectReturn" sender:_sourceViewController];
    BOOL shouldPerformMethodWithoutSenderWasCalled = _sourceViewController.shouldPerformMethodWithoutSenderWasCalled;
    XCTAssertTrue(shouldPerformMethodWithoutSenderWasCalled);
}

@end
