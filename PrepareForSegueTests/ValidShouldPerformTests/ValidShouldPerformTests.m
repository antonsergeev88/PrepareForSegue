//
//  ValidShouldPerformTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidShouldPerformTestsViewController.h"

@interface ValidShouldPerformTests : XCTestCase {
    ValidShouldPerformTestsViewController *_sourceViewController;
}

@end

@implementation ValidShouldPerformTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[ValidShouldPerformTestsViewController alloc] init];
}

- (void)tearDown {
    _sourceViewController = nil;
    [super tearDown];
}

- (void)testCallingShouldPerformSegue {
    [_sourceViewController shouldPerformSegueWithIdentifier:@"Testing" sender:_sourceViewController];
    BOOL shouldPerformMethodWasCalled = _sourceViewController.shouldPerformMethodWasCalled;
    XCTAssertTrue(shouldPerformMethodWasCalled);
}

@end
