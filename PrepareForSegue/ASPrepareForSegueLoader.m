//
//  ASPrepareForSegueLoader.m
//  PrepareForSegue
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

static void as_prepareForSegue_sender(UIViewController *self, SEL _cmd, UIStoryboardSegue *segue, id sender) {
    NSString *identifier = segue.identifier;
    if (!identifier.length) {
        return;
    }
    NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareFor%@", identifier];
    SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
    SEL originalPrepareForSegueSelector = NSSelectorFromString(@"prepareForSegue:sender:");
    if ([self respondsToSelector:prepareForSegueSelector]) {
        Method prepareForSegueMethod = class_getInstanceMethod(self.class, prepareForSegueSelector);
        char *returnType = method_copyReturnType(prepareForSegueMethod);
        Method originalPrepareForSegueMethod = class_getInstanceMethod(self.class, originalPrepareForSegueSelector);
        char *originalReturnType = method_copyReturnType(originalPrepareForSegueMethod);
        if (!strcmp(returnType, originalReturnType)) {
            [self performSelector:prepareForSegueSelector];
        }
        free(returnType);
        free(originalReturnType);
    }
}

static void as_shouldPerformSegueWithIdentifier_sender(UIViewController *self, SEL _cmd, NSString *identifier, id sender) {
    if (!identifier.length) {
        return;
    }
    NSString *shouldPerformSegueSelectorString = [NSString stringWithFormat:@"shouldPerform%@", identifier];
    SEL shouldPerformSegueSelector = NSSelectorFromString(shouldPerformSegueSelectorString);
    SEL originalShouldPerformSegueSelector = NSSelectorFromString(@"shouldPerformSegueWithIdentifier:sender:");
    if ([self respondsToSelector:shouldPerformSegueSelector]) {
        Method shouldPerformSegueMethod = class_getInstanceMethod(self.class, shouldPerformSegueSelector);
        char *returnType = method_copyReturnType(shouldPerformSegueMethod);
        Method originalShouldPerformSegueMethod = class_getInstanceMethod(self.class, originalShouldPerformSegueSelector);
        char *originalReturnType = method_copyReturnType(originalShouldPerformSegueMethod);
        if (!strcmp(returnType, originalReturnType)) {
            [self performSelector:shouldPerformSegueSelector];
        }
        free(returnType);
        free(originalReturnType);
    }
}

@interface ASPrepareForSegueLoader : NSObject

@end

@implementation ASPrepareForSegueLoader

+ (void)load {
    Class viewControllerClass = objc_getClass("UIViewController");

    SEL prepareForSegueSelector = NSSelectorFromString(@"prepareForSegue:sender:");
    Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueSelector);
    method_setImplementation(prepareForSegueMethod, (IMP)as_prepareForSegue_sender);

    SEL shouldPerformSegueSelector = NSSelectorFromString(@"shouldPerformSegueWithIdentifier:sender:");
    Method shouldPerformSegueMethod = class_getInstanceMethod(viewControllerClass, shouldPerformSegueSelector);
    method_setImplementation(shouldPerformSegueMethod, (IMP)as_shouldPerformSegueWithIdentifier_sender);
}

@end
