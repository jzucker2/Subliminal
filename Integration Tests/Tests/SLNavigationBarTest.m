//
//  SLNavigationBarTest.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface focus_SLNavigationBarTest : SLIntegrationTest

@end

@implementation focus_SLNavigationBarTest {
    SLNavigationBar *_aNavigationBar;

}

+ (NSString *) testCaseViewControllerClassName {
    return @"SLNavigationBarTestViewController";
}

- (void) setUpTestCaseWithSelector:(SEL)testCaseSelector {
    [super setUpTestCaseWithSelector:testCaseSelector];
    _aNavigationBar = [SLNavigationBar elementWithAccessibilityLabel:@"navigationBar"];
    [_aNavigationBar logElement];

    //SLAssertTrue([UIAElement(_aNavigationBar) isValidAndVisible], @"NavigationBar should be valid and visible");
}

- (void) setUpTest {
    [super setUpTest];
//    _aNavigationBar = [SLNavigationBar elementWithAccessibilityLabel:@"navigationBar"];
//    [_aNavigationBar logElement];
}

//- (void) testNavigationBarIsVisible {
//    SLAssertTrue([UIAElement(_aNavigationBar) isVisible],  @"NavigationBar should be visible");
//}

- (void) testTapRightButton {
    SLAssertTrue([UIAElement(_aNavigationBar) isTappable], @"Right button should be tappable");
}

@end
