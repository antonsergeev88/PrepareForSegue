//
//  ValidPrepareTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 27.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidPrepareTestsViewController.h"

@interface ValidPrepareTests : XCTestCase {
    ValidPrepareTestsViewController *_sourceViewController;
    UIViewController *_destinationViewController;
    UIStoryboardSegue *_segue;
}

@end

@implementation ValidPrepareTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidPrepareTestsViewController alloc] init];
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

- (void)testCallingPreparePerformance {
    [self measureBlock:^{
        [self->_sourceViewController prepareForSegue:self->_segue sender:self->_sourceViewController];
    }];
}

@end
