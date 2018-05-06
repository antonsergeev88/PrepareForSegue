//
//  ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController.h
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 07.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidShouldPerformAndInvalidShouldPerformWithSenderTestsViewController : UIViewController

@property (nonatomic, readonly) BOOL shouldPerformMethodWithoutSenderWasCalled;
@property (nonatomic, readonly) BOOL shouldPerformMethodWithSenderWasCalled;

@end
