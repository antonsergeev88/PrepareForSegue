//
//  ValidPrepareAndInvalidPrepareWithSenderTestsViewController.h
//  PrepareForSegueTests
//
//  Created by Anton Sergeev on 06.05.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValidPrepareAndInvalidPrepareWithSenderTestsViewController : UIViewController

@property (nonatomic, readonly) BOOL prepareMethodWithoutSenderWasCalled;
@property (nonatomic, readonly) BOOL prepareMethodWithSenderWasCalled;

@end
