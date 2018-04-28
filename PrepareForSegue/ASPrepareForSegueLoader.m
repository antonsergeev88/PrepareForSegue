//
//  ASPrepareForSegueLoader.m
//  PrepareForSegue
//
//  Created by Anton Sergeev on 28.04.2018.
//  Copyright © 2018 antonsergeev88. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <objc/message.h>

static void as_prepareForSegue_sender(UIViewController *self, SEL _cmd, UIStoryboardSegue *segue, id sender) {
    NSString *identifier = segue.identifier;
    if (!identifier.length) {
        return;
    }
    NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareFor%@", identifier];
    SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
    SEL originalPrepareForSegueSelector = NSSelectorFromString(@"prepareForSegue:sender:");
    Class viewControllerClass = object_getClass(self);
    BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, prepareForSegueSelector);
    if (viewControllerRespondsToSelector) {
        Method prepareForSegueMethod = class_getInstanceMethod(self.class, prepareForSegueSelector);
        char *returnType = method_copyReturnType(prepareForSegueMethod);
        Method originalPrepareForSegueMethod = class_getInstanceMethod(self.class, originalPrepareForSegueSelector);
        char *originalReturnType = method_copyReturnType(originalPrepareForSegueMethod);
        BOOL viewControllerHasValidPrepareMethod = !strcmp(returnType, originalReturnType);
        free(returnType);
        free(originalReturnType);
        if (viewControllerHasValidPrepareMethod) {
            void (*voidReturnMessageSend)(id receiver, SEL operation);
            voidReturnMessageSend = (void(*)(id, SEL))objc_msgSend;
            voidReturnMessageSend(self, prepareForSegueSelector);
        }
    }
}

static BOOL as_shouldPerformSegueWithIdentifier_sender(UIViewController *self, SEL _cmd, NSString *identifier, id sender) {
    if (!identifier.length) {
        return YES;
    }
    NSString *shouldPerformSegueSelectorString = [NSString stringWithFormat:@"shouldPerform%@", identifier];
    SEL shouldPerformSegueSelector = NSSelectorFromString(shouldPerformSegueSelectorString);
    SEL originalShouldPerformSegueSelector = NSSelectorFromString(@"shouldPerformSegueWithIdentifier:sender:");
    Class viewControllerClass = object_getClass(self);
    BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, shouldPerformSegueSelector);
    if (viewControllerRespondsToSelector) {
        Method shouldPerformSegueMethod = class_getInstanceMethod(self.class, shouldPerformSegueSelector);
        char *returnType = method_copyReturnType(shouldPerformSegueMethod);
        Method originalShouldPerformSegueMethod = class_getInstanceMethod(self.class, originalShouldPerformSegueSelector);
        char *originalReturnType = method_copyReturnType(originalShouldPerformSegueMethod);
        BOOL viewControllerHasValidShouldPerformMethod = !strcmp(returnType, originalReturnType);
        free(returnType);
        free(originalReturnType);
        if (viewControllerHasValidShouldPerformMethod) {
            BOOL (*boolReturnMessageSend)(id receiver, SEL operation);
            boolReturnMessageSend = (BOOL(*)(id, SEL))objc_msgSend;
            BOOL shouldPerformSegue = boolReturnMessageSend(self, shouldPerformSegueSelector);
            return shouldPerformSegue;
        }
    }
    return YES;
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