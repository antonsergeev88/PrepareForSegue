//
//  ValidPrepareWithSenderTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 05.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidPrepareWithSenderTestsViewController.h"

@interface ValidPrepareWithSenderTests : XCTestCase {
    ValidPrepareWithSenderTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
    UIStoryboardSegue *_segue;
}

@end

@implementation ValidPrepareWithSenderTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidPrepareWithSenderTestsViewController alloc] init];
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

- (void)testCallingPrepareForSegue {
    [_sourceViewController prepareForSegue:_segue sender:_sourceViewController];
    BOOL prepareMethodWasCalled = _sourceViewController.prepareMethodWasCalled;
    XCTAssertTrue(prepareMethodWasCalled);
}

@end
