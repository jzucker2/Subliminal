//
//  SLTableView.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTableView.h"
#import "SLUIAElement+Subclassing.h"

@implementation SLTableView

- (BOOL) matchesObject:(NSObject *)object {
    return [super matchesObject:object] && [object isKindOfClass:[UITableView class]];
}

- (NSArray *) cells {
    return [self waitUntilTappable:NO thenSendMessage:@"cells()"];
}

- (NSArray *) groups {
    return [self waitUntilTappable:NO thenSendMessage:@"groups()"];
}

- (NSArray *) visibleCells {
    return [self waitUntilTappable:NO thenSendMessage:@"visibleCells()"];
}

@end
