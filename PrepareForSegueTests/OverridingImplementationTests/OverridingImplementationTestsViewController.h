//
//  OverridingImplementationTestsViewController.h
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 30.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverridingImplementationTestsViewController : UIViewController

@property (nonatomic, readonly) BOOL prepareMethodWasCalled;
@property (nonatomic, readonly) BOOL overridedPrepareMethodWasCalled;
@property (nonatomic, readonly) BOOL shouldPerformMethodWasCalled;
@property (nonatomic, readonly) BOOL overridedShouldPerformMethodWasCalled;

@end
