//
//  ValidPrepareAndInvalidPrepareWithSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidPrepareAndInvalidPrepareWithSenderTestsViewController.h"

@interface ValidPrepareAndInvalidPrepareWithSenderTests : XCTestCase {
    ValidPrepareAndInvalidPrepareWithSenderTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
}

@end

@implementation ValidPrepareAndInvalidPrepareWithSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidPrepareAndInvalidPrepareWithSenderTestsViewController alloc] init];
    _destinationViewController = [[UIViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    _destinationViewController = nil;
    [super tearDown];
}

- (void)testNotCallingPrepareForSegueWithScalarSender {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ScalarSender"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertFalse(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutScalarSender {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ScalarSender"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertTrue(prepareMethodWithoutSenderWasCalled);
}

- (void)testNotCallingPrepareForSegueWithPointerSender {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"PointerSender"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertFalse(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutPointerSender {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"PointerSender"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertTrue(prepareMethodWithoutSenderWasCalled);
}

- (void)testNotCallingPrepareForSegueWithScalarReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ScalarReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertFalse(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutScalarReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ScalarReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertTrue(prepareMethodWithoutSenderWasCalled);
}

- (void)testNotCallingPrepareForSegueWithPointerReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"PointerReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertFalse(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutPointerReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"PointerReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertTrue(prepareMethodWithoutSenderWasCalled);
}

- (void)testNotCallingPrepareForSegueWithObjectReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ObjectReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertFalse(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutObjectReturn {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"ObjectReturn"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertTrue(prepareMethodWithoutSenderWasCalled);
}

@end
