//
//  SLToolbar.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLToolbar.h"
#import "SLUIAElement+Subclassing.h"

@implementation SLToolbar

- (BOOL) matchesObject:(NSObject *)object {
    return [super matchesObject:object] && [object isKindOfClass:[UIToolbar class]];
}

@end
