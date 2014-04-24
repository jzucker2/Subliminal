//
//  SLNavigationBar.h
//  Subliminal
//
//  Created by Jordan Zucker on 4/24/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLElement.h"
#import "SLUIAElement+Subclassing.h"

/**
 `SLNavigationBar` matches against instances of `UINavigationBar`.

 Will find an element matching the parameters that appears inside
 a navigationBar.
 */
@interface SLNavigationBar : SLElement

/**
 Returns the child element matching one provided that is child of caller

 This is implemented specially for UITableViewCell.

 @param childElement A `SLElement` with your provided specifications.

 @return `SLElement` matching specifications of the parameter and appearing as an accessibilityChild of the caller.
 */
- (id)childElementMatching:(SLElement *)childElement;

@end
