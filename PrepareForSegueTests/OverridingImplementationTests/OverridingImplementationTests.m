//
//  OverridingImplementationTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 30.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OverridingImplementationTestsViewController.h"

@interface OverridingImplementationTests : XCTestCase {
    OverridingImplementationTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
    UIStoryboardSegue *_segue;
}

@end

@implementation OverridingImplementationTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[OverridingImplementationTestsViewController alloc] init];
    _destinationViewController = [[UIViewController alloc] init];
    _segue = [UIStoryboardSegue segueWithIdentifier:@"Testing"
                                             source:_sourceViewController
                                        destination:_destinationViewController
                                     performHandler:^{}];
}

- (void)tearDown {
    _sourceViewController = nil;
    _destinationViewController = nil;
    _segue = nil;
    [super tearDown];
}

- (void)testCallingOverridedPrepareImplementation {
    [_sourceViewController prepareForSegue:_segue sender:_sourceViewController];
    BOOL overridedPrepareMethodWasCalled = _sourceViewController.overridedPrepareMethodWasCalled;
    XCTAssertTrue(overridedPrepareMethodWasCalled);
}

- (void)testNotCallingCustomPrepareImplementation {
    [_sourceViewController prepareForSegue:_segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertFalse(prepareMethodWasCalled);
}

- (void)testCallingOverridedShouldImplementation {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL overridedShouldPerformMethodWasCalled = _sourceViewController.overridedShouldPerformMethodWasCalled;
    XCTAssertTrue(overridedShouldPerformMethodWasCalled);
}

- (void)testNotCallingCustomShouldImplementation {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertFalse(shouldPerformMethodWasCalled);
}

@end
