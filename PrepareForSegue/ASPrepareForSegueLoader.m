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

static int compareMethodReturnTypes(Method firstMethod, Method secondMethod) {
    char firstMethodReturnType[2] = {0};
    method_getReturnType(firstMethod, firstMethodReturnType, sizeof(firstMethodReturnType) - 1);
    char secondMethodReturnType[2] = {0};
    method_getReturnType(secondMethod, secondMethodReturnType, sizeof(secondMethodReturnType) - 1);
    return strcmp(firstMethodReturnType, secondMethodReturnType);
}

static int compareMethodArgumentTypes(Method firstMethod, unsigned int firstIndex,
                                      Method secondMethod, unsigned int secondIndex) {
    char firstMethodArgumentType[2] = {0};
    method_getArgumentType(firstMethod, firstIndex, firstMethodArgumentType, sizeof(firstMethodArgumentType) - 1);
    char secondMethodArgumentType[2] = {0};
    method_getArgumentType(secondMethod, secondIndex, secondMethodArgumentType, sizeof(secondMethodArgumentType) - 1);
    return strcmp(firstMethodArgumentType, secondMethodArgumentType);
}

static void prepareForSegue_sender(UIViewController *self, SEL _cmd, UIStoryboardSegue *segue, id sender) {
    NSString *identifier = segue.identifier;
    if (!identifier.length) {
        return;
    }

    Class viewControllerClass = object_getClass(self);
    SEL originalPrepareForSegueSelector = sel_registerName("prepareForSegue:sender:");
    Method originalPrepareForSegueMethod = class_getInstanceMethod(viewControllerClass, originalPrepareForSegueSelector);

    {
        NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareFor%@WithSender:", identifier];
        SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
        if (class_respondsToSelector(viewControllerClass, prepareForSegueSelector)) {
            Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(prepareForSegueMethod, originalPrepareForSegueMethod);
            BOOL argumentIsValid = !compareMethodArgumentTypes(prepareForSegueMethod, 2, originalPrepareForSegueMethod, 3);
            BOOL viewControllerHasValidPrepareMethod = returnTypeIsValid && argumentIsValid;
            if (viewControllerHasValidPrepareMethod) {
                void (*voidReturnMessageSend)(id receiver, SEL operation, id sender);
                voidReturnMessageSend = (void(*)(id, SEL, id))objc_msgSend;
                voidReturnMessageSend(self, prepareForSegueSelector, sender);
                return;
            }
        }
    }

    {
        NSString *prepareForSegueSelectorString = [NSString stringWithFormat:@"prepareFor%@", identifier];
        SEL prepareForSegueSelector = NSSelectorFromString(prepareForSegueSelectorString);
        if (class_respondsToSelector(viewControllerClass, prepareForSegueSelector)) {
            Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(prepareForSegueMethod, originalPrepareForSegueMethod);
            BOOL viewControllerHasValidPrepareMethod = returnTypeIsValid;
            if (viewControllerHasValidPrepareMethod) {
                void (*voidReturnMessageSend)(id receiver, SEL operation);
                voidReturnMessageSend = (void(*)(id, SEL))objc_msgSend;
                voidReturnMessageSend(self, prepareForSegueSelector);
                return;
            }
        }
    }
}

static BOOL shouldPerformSegueWithIdentifier_sender(UIViewController *self, SEL _cmd, NSString *identifier, id sender) {
    if (!identifier.length) {
        return YES;
    }

    Class viewControllerClass = object_getClass(self);
    SEL originalShouldPerformSegueSelector = NSSelectorFromString(@"shouldPerformSegueWithIdentifier:sender:");
    Method originalShouldPerformSegueMethod = class_getInstanceMethod(self.class, originalShouldPerformSegueSelector);

    {
        NSString *shouldPerformSegueSelectorString = [NSString stringWithFormat:@"shouldPerform%@WithSender:", identifier];
        SEL shouldPerformSegueSelector = NSSelectorFromString(shouldPerformSegueSelectorString);
        BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, shouldPerformSegueSelector);
        if (viewControllerRespondsToSelector) {
            Method shouldPerformSegueMethod = class_getInstanceMethod(self.class, shouldPerformSegueSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(shouldPerformSegueMethod, originalShouldPerformSegueMethod);
            BOOL argumentIsValid = !compareMethodArgumentTypes(shouldPerformSegueMethod, 2, originalShouldPerformSegueMethod, 3);
            BOOL viewControllerHasValidShouldPerformMethod = returnTypeIsValid && argumentIsValid;
            if (viewControllerHasValidShouldPerformMethod) {
                BOOL (*boolReturnMessageSend)(id receiver, SEL operation);
                boolReturnMessageSend = (BOOL(*)(id, SEL))objc_msgSend;
                BOOL shouldPerformSegue = boolReturnMessageSend(self, shouldPerformSegueSelector);
                return shouldPerformSegue;
            }
        }
    }

    {
        NSString *shouldPerformSegueSelectorString = [NSString stringWithFormat:@"shouldPerform%@", identifier];
        SEL shouldPerformSegueSelector = NSSelectorFromString(shouldPerformSegueSelectorString);
        BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, shouldPerformSegueSelector);
        if (viewControllerRespondsToSelector) {
            Method shouldPerformSegueMethod = class_getInstanceMethod(self.class, shouldPerformSegueSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(shouldPerformSegueMethod, originalShouldPerformSegueMethod);
            BOOL viewControllerHasValidShouldPerformMethod = returnTypeIsValid;
            if (viewControllerHasValidShouldPerformMethod) {
                BOOL (*boolReturnMessageSend)(id receiver, SEL operation);
                boolReturnMessageSend = (BOOL(*)(id, SEL))objc_msgSend;
                BOOL shouldPerformSegue = boolReturnMessageSend(self, shouldPerformSegueSelector);
                return shouldPerformSegue;
            }
        }
    }

    return YES;
}

static BOOL (*originalCanPerformUnwindSegueAction_fromViewController_withSender)(UIViewController *self, SEL _cmd, SEL action, UIViewController *fromViewController, id sender);

static BOOL canPerformUnwindSegueAction_fromViewController_withSender(UIViewController *self, SEL _cmd, SEL action, UIViewController *fromViewController, id sender) {
    BOOL originalReturn = originalCanPerformUnwindSegueAction_fromViewController_withSender(self, _cmd, action, fromViewController, sender);
    if (!originalReturn) {
        return originalReturn;
    }

    Class viewControllerClass = object_getClass(self);
    SEL originalCanPerformSelector = sel_registerName("canPerformUnwindSegueAction:fromViewController:withSender:");
    Method originalCanPerformMethod = class_getInstanceMethod(viewControllerClass, originalCanPerformSelector);

    const char *actionSelectorName = sel_getName(action);
    size_t actionSelectorNameLength = strlen(actionSelectorName);
    char *uppercaseActionName = malloc(sizeof(actionSelectorName));
    strcpy(uppercaseActionName, actionSelectorName);
    uppercaseActionName[actionSelectorNameLength - 1] = '\0';
    uppercaseActionName[0] = toupper(uppercaseActionName[0]);
    size_t actionNameLength = strlen(uppercaseActionName);

    {
        char *canPerformSelectorName = malloc(actionNameLength + 3 + 1);
        strcpy(canPerformSelectorName, "can");
        strcat(canPerformSelectorName, uppercaseActionName);
        strcat(canPerformSelectorName, ":");
        SEL canPerformSelector = sel_registerName(canPerformSelectorName);
        free(canPerformSelectorName);
        BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, canPerformSelector);
        if (viewControllerRespondsToSelector) {
            Method canPerformMethod = class_getInstanceMethod(viewControllerClass, canPerformSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(canPerformMethod, originalCanPerformMethod);
            BOOL viewControllerHasValidCanPerformMethod = returnTypeIsValid;
            if (viewControllerHasValidCanPerformMethod) {
                BOOL (*boolReturnMessageSend)(id receiver, SEL operation, id sender);
                boolReturnMessageSend = (BOOL(*)(id, SEL, id))objc_msgSend;
                BOOL canPerform = boolReturnMessageSend(self, canPerformSelector, sender);
                free(uppercaseActionName);
                return canPerform;
            }
        }
    }

    {
        char *canPerformSelectorName = malloc(actionNameLength + 3);
        strcpy(canPerformSelectorName, "can");
        strcat(canPerformSelectorName, uppercaseActionName);
        SEL canPerformSelector = sel_registerName(canPerformSelectorName);
        free(canPerformSelectorName);
        BOOL viewControllerRespondsToSelector = class_respondsToSelector(viewControllerClass, canPerformSelector);
        if (viewControllerRespondsToSelector) {
            Method canPerformMethod = class_getInstanceMethod(viewControllerClass, canPerformSelector);
            BOOL returnTypeIsValid = !compareMethodReturnTypes(canPerformMethod, originalCanPerformMethod);
            BOOL viewControllerHasValidCanPerformMethod = returnTypeIsValid;
            if (viewControllerHasValidCanPerformMethod) {
                BOOL (*boolReturnMessageSend)(id receiver, SEL operation);
                boolReturnMessageSend = (BOOL(*)(id, SEL))objc_msgSend;
                BOOL canPerform = boolReturnMessageSend(self, canPerformSelector);
                free(uppercaseActionName);
                return canPerform;
            }
        }
    }

    free(uppercaseActionName);
    return originalReturn;
}

@interface ASPrepareForSegueLoader : NSObject

@end

@implementation ASPrepareForSegueLoader

+ (void)load {
    Class viewControllerClass = objc_getClass("UIViewController");

    SEL prepareForSegueSelector = NSSelectorFromString(@"prepareForSegue:sender:");
    Method prepareForSegueMethod = class_getInstanceMethod(viewControllerClass, prepareForSegueSelector);
    method_setImplementation(prepareForSegueMethod, (IMP)prepareForSegue_sender);

    SEL shouldPerformSegueSelector = NSSelectorFromString(@"shouldPerformSegueWithIdentifier:sender:");
    Method shouldPerformSegueMethod = class_getInstanceMethod(viewControllerClass, shouldPerformSegueSelector);
    method_setImplementation(shouldPerformSegueMethod, (IMP)shouldPerformSegueWithIdentifier_sender);

    SEL canPerformUnwindSegueActionSelector = NSSelectorFromString(@"canPerformUnwindSegueAction:fromViewController:withSender:");
    Method canPerformUnwindSegueActionMethod = class_getInstanceMethod(viewControllerClass, canPerformUnwindSegueActionSelector);
    IMP originalCanPerformUnwindSegueActionImplementation = method_getImplementation(canPerformUnwindSegueActionMethod);
    originalCanPerformUnwindSegueAction_fromViewController_withSender = (BOOL(*)(id, SEL, SEL, UIViewController *, id))originalCanPerformUnwindSegueActionImplementation;
    method_setImplementation(canPerformUnwindSegueActionMethod, (IMP)canPerformUnwindSegueAction_fromViewController_withSender);
}

@end
