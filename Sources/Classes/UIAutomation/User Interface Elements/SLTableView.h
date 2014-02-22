//
//  SLTableView.h
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLScrollView.h"

@interface SLTableView : SLScrollView

- (NSArray *) cells;
- (NSArray *) groups;
- (NSArray *) visibleCells;

@end
