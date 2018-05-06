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
    NSString *prepareForSegueWithSenderSelectorString = [NSString stringWithFormat:@"prepareFor%@WithSender:",
                                                         identifier];
    SEL prepareForSegueWithSenderSelector = NSSelectorFromString(prepareForSegueWithSenderSelectorString);
    SEL originalPrepareForSegueSelector = NSSelectorFromString(@"prepareForSegue:sender:");
    Class viewControllerClass = object_getClass(self);
    BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, prepareForSegueSelector);
    BOOL viewControllerRespondsToSelectorWithSender = class_respondsToSelector(viewControllerClass,
                                                                               prepareForSegueWithSenderSelector);
    if (viewControllerRespondsToSelectorWithSender) {
        Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueWithSenderSelector);
        Method originalPrepareForSegueMethod = class_getInstanceMethod(viewControllerClass,
                                                                       originalPrepareForSegueSelector);

        char *returnType = method_copyReturnType(prepareForSegueMethod);
        char *originalReturnType = method_copyReturnType(originalPrepareForSegueMethod);
        BOOL returnTypeIsValid = !strcmp(returnType, originalReturnType);
        free(returnType);
        free(originalReturnType);

        char *argumentType = method_copyArgumentType(prepareForSegueMethod, 2);
        char *originalArgumentType = method_copyArgumentType(originalPrepareForSegueMethod, 3);
        BOOL argumentIsValid = !strcmp(argumentType, originalArgumentType);
        free(argumentType);
        free(originalArgumentType);

        BOOL viewControllerHasValidPrepareMethod = returnTypeIsValid && argumentIsValid;
        if (viewControllerHasValidPrepareMethod) {
            void (*voidReturnMessageSend)(id receiver, SEL operation, id sender);
            voidReturnMessageSend = (void(*)(id, SEL, id))objc_msgSend;
            voidReturnMessageSend(self, prepareForSegueWithSenderSelector, sender);
            return;
        }
    }
    if (viewControllerRespondsToSelector) {
        Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueSelector);
        Method originalPrepareForSegueMethod = class_getInstanceMethod(viewControllerClass,
                                                                       originalPrepareForSegueSelector);

        char *returnType = method_copyReturnType(prepareForSegueMethod);
        char *originalReturnType = method_copyReturnType(originalPrepareForSegueMethod);
        BOOL returnTypeIsValid = !strcmp(returnType, originalReturnType);
        free(returnType);
        free(originalReturnType);

        BOOL viewControllerHasValidPrepareMethod = returnTypeIsValid;
        if (viewControllerHasValidPrepareMethod) {
            void (*voidReturnMessageSend)(id receiver, SEL operation);
            voidReturnMessageSend = (void(*)(id, SEL))objc_msgSend;
            voidReturnMessageSend(self, prepareForSegueSelector);
            return;
        }
    }
}

static BOOL as_shouldPerformSegueWithIdentifier_sender(UIViewController *self,
                                                       SEL _cmd,
                                                       NSString *identifier,
                                                       id sender) {
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
        Method originalShouldPerformSegueMethod = class_getInstanceMethod(self.class,
                                                                          originalShouldPerformSegueSelector);
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
