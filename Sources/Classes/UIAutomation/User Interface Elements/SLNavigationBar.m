//
//  SLNavigationBar.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLNavigationBar.h"
#import "SLUIAElement+Subclassing.h"
#import "SLButton.h"

@implementation SLNavigationBar

- (BOOL)matchesObject:(NSObject *)object {
    return ([super matchesObject:object] && [object isKindOfClass:[UINavigationBar class]]);
}

- (SLButton *) leftButton {
    return [self waitUntilTappable:NO thenSendMessage:@"leftButton()"];
}

- (SLButton *) rightButton {
    return [self waitUntilTappable:NO thenSendMessage:@"rightButton()"];
}

@end
