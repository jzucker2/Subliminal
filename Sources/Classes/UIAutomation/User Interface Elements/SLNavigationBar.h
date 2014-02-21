//
//  SLNavigationBar.h
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLElement.h"

/**
 SLNavigationBar matches instances of `UINavigationBar`.
 */

@class SLButton;
@interface SLNavigationBar : SLElement

- (SLButton *) leftButton;
- (SLButton *) rightButton;

@end
