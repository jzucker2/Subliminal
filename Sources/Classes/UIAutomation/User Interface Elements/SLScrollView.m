//
//  SLScrollView.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLScrollView.h"
#import "SLUIAElement+Subclassing.h"

@implementation SLScrollView

- (BOOL) matchesObject:(NSObject *)object {
    return [super matchesObject:object] && [object isKindOfClass:[UIScrollView class]];
}

- (void) scrollUp {
    [self waitUntilTappable:NO thenSendMessage:@"scrollUp()"];
}

- (void) scrollDown {
    [self waitUntilTappable:NO thenSendMessage:@"scrollDown()"];
}

- (void) scrollLeft {
    [self waitUntilTappable:NO thenSendMessage:@"scrollLeft()"];
}

- (void) scrollRight {
    [self waitUntilTappable:NO thenSendMessage:@"scrollRight()"];
}

- (SLElement *) scrollToElementWithName:(NSString *)name {
    return [self waitUntilTappable:NO thenSendMessage:@"scrollToElementWithName(%@)", name];
}

- (SLElement *) scrollToElementWithPredicate:(NSString *)predicate {
    return [self waitUntilTappable:NO thenSendMessage:@"scrollToElementWithPredicate(%@)", predicate];
}

- (SLElement *) scrollToElementWithValue:(NSString *)value forKey:(NSString *)key {
    return [self waitUntilTappable:NO thenSendMessage:@"scrollToElementWithValueForKey(%@, %@)", value, key];
}

@end
