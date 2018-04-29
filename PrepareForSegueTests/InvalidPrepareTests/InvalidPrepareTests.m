//
//  InvalidPrepareTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InvalidPrepareTestsViewController.h"

@interface InvalidPrepareTests : XCTestCase {
    InvalidPrepareTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
}

@end

@implementation InvalidPrepareTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[InvalidPrepareTestsViewController alloc] init];
    _destinationViewController = [[UIViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    _destinationViewController = nil;
    [super tearDown];
}

- (void)testNotCallingInvalidPrepareForSegueWithScalarReturnValue {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithScalarReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testNotCallingInvalidPrepareForSegueWithScalarReturnValuePerformance {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithScalarReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:segue sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingInvalidPrepareForSegueWithPointerReturnValue {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithPointerReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testNotCallingInvalidPrepareForSegueWithPointerReturnValuePerformance {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithPointerReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:segue sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingInvalidPrepareForSegueWithObjectReturnValue {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithObjectReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testNotCallingInvalidPrepareForSegueWithObjectReturnValuePerformance {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithObjectReturnValue"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:segue sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingInvalidPrepareForSegueWithNoMethodForSelector {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithNoMethodForSelector"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testNotCallingInvalidPrepareForSegueWithNoMethodForSelectorPerformance {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@"TestingWithNoMethodForSelector"
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:segue sender:self->_sourceViewController];
    }];
}

- (void)testNotCallingInvalidPrepareForSegueWithEmptyIdentifier {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@""
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [_sourceViewController prepareForSegue:segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testNotCallingInvalidPrepareForSegueWithEmptyIdentifierPerformance {
    UIStoryboardSegue *segue = [UIStoryboardSegue segueWithIdentifier:@""
                                                               source:_sourceViewController
                                                          destination:_destinationViewController
                                                       performHandler:^{}];
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:segue sender:self->_sourceViewController];
    }];
}

@end
