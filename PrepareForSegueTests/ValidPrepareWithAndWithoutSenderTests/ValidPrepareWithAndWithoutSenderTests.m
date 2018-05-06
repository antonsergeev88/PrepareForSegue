//
//  ValidPrepareWithAndWithoutSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidPrepareWithAndWithoutSenderTestsViewController.h"

@interface ValidPrepareWithAndWithoutSenderTests : XCTestCase {
    ValidPrepareWithAndWithoutSenderTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
    UIStoryboardSegue *_segue;
}

@end

@implementation ValidPrepareWithAndWithoutSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidPrepareWithAndWithoutSenderTestsViewController alloc] init];
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

- (void)testCallingPrepareForSegueWithSender {
    [_sourceViewController prepareForSegue:_segue sender:_sourceViewController];
    BOOL prepareMethodWithSenderWasCalled = _sourceViewController.prepareMethodWithSenderWasCalled;
    XCTAssertTrue(prepareMethodWithSenderWasCalled);
}

- (void)testCallingPrepareForSegueWithoutSender {
    [_sourceViewController prepareForSegue:_segue sender:_sourceViewController];
    BOOL prepareMethodWithoutSenderWasCalled = _sourceViewController.prepareMethodWithoutSenderWasCalled;
    XCTAssertFalse(prepareMethodWithoutSenderWasCalled);
}

- (void)testCallingPreparePerformance {
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:self->_segue sender:self->_sourceViewController];
    }];
}

@end
