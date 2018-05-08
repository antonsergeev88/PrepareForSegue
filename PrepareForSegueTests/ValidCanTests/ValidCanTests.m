//
//  ValidCanTests.m
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 08.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ValidCanTestsViewController.h"

@interface ValidCanTests : XCTestCase {
    UIViewController *_sourceViewController;
    ValidCanTestsViewController *_destinationViewController;
    SEL _unwindAction;
}

@end

@implementation ValidCanTests

- (void)setUp {
    [super setUp];
    _sourceViewController = [[UIViewController alloc] init];
    _destinationViewController = [[ValidCanTestsViewController alloc] init];
    _unwindAction = NSSelectorFromString(@"test:");
}

- (void)tearDown {
    _sourceViewController = nil;
    _unwindAction = NULL;
    [super tearDown];
}

- (void)testCallingCanMethod {
    [_destinationViewController canPerformUnwindSegueAction:_unwindAction
                                    fromViewController:_sourceViewController
                                            withSender:_sourceViewController];
    BOOL canMethodWasCalled = _destinationViewController.canMethodWasCalled;
    XCTAssertTrue(canMethodWasCalled);
}

@end
