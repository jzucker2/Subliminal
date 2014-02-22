//
//  SLScrollView.h
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLElement.h"

@interface SLScrollView : SLElement

- (void) scrollUp;
- (void) scrollDown;
- (void) scrollLeft;
- (void) scrollRight;
- (SLElement *) scrollToElementWithName:(NSString *)name;
- (SLElement *) scrollToElementWithPredicate:(NSString *)predicateString;
- (SLElement *) scrollToElementWithValue:(NSString *) value forKey:(NSString *)key;

@end
