//
//  SLTableViewCellChildElementsTests.m
//  Subliminal
//
//  Created by Jordan Zucker on 3/13/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"

@interface focus_SLTableViewCellChildElementsTests : SLIntegrationTest

@end

@implementation focus_SLTableViewCellChildElementsTests

+ (NSString *)testCaseViewControllerClassName {
    return @"SLTableViewCellChildElementsTestsViewController";
}

// If you override set-up methods,
// you must call super at the beginning of your implementations.

// If you override tear-down methods,
// you must call super at the *end* of your implementations.

- (void)testTapBroadMatchingTableViewCellButton {
//#warning Incomplete method implementation.
	// Rename and implement test case.
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"start"];

    SLButton *favoriteButton = [SLButton elementWithAccessibilityLabel:@"Favorite"];
    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"off"], @"favorite button is not originally off");
    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: starting"];

    [UIAElement(favoriteButton) tap];

    [self wait:1];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"after tap"];
    [favoriteButton captureScreenshotWithFilename:@"fb: after first tap"];

    //SLButton *unfavoriteButton = [SLButton elementWithAccessibilityLabel:@"Unfavorite"];
    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"favorite button is not valid and visible after first time tapping");
    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"on"], @"Favorite button does not has ax value of on");
    [UIAElement(favoriteButton) tap];

    [self wait:1];

    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"off"], @"favorite button is not off at end of test");
    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: ending"];


    [[SLDevice currentDevice] captureScreenshotWithFilename:@"end of test"];


    SLLogAsync(@"testing");
    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton description is %@", [favoriteButton slAccessibilityDescription]);
    SLLogAsync(@"favoriteButton parent is %@", [favoriteButton slAccessibilityParent]);
    SLLogAsync(@"favoriteButton recursive description is %@", [favoriteButton slRecursiveAccessibilityDescription]);
    SLLogAsync(@"now log element tree for favorite button");
    [favoriteButton logElementTree];
}

- (void)testHackMatchingTableViewCell
{
    [[SLWindow mainWindow] logElementTree];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"start"];
    SLButton *favoriteButton = [SLButton elementMatching:^BOOL(NSObject *obj) {

        if ([obj.accessibilityLabel isEqualToString:@"Favorite"]) {

            id accessibilityParent = [obj slAccessibilityParent];

            //SLLogAsync(@"starting: accessibilityParent is %@", accessibilityParent);
            while (accessibilityParent && ![NSStringFromClass([accessibilityParent class]) isEqualToString:@"UITableViewCellAccessibilityElement"]) {

                accessibilityParent = [accessibilityParent slAccessibilityParent];
                //SLLogAsync(@"get accessibilityParent that is now %@", accessibilityParent);

            }

            //SLLogAsync(@"[accessibilityParent accessibilityLabel] is %@", [accessibilityParent accessibilityLabel]);
            return [[accessibilityParent accessibilityLabel] isEqualToString:@"Cell 2"];

        }
        
        return NO;
        
    } withDescription:@"searching for favoritebutton"];

    SLLogAsync(@"favoriteButton is %@", favoriteButton);


    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"off"], @"favorite button is not originally off");
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: starting"];

    [UIAElement(favoriteButton) tap];

    [self wait:1];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"after tap"];
    [favoriteButton captureScreenshotWithFilename:@"fb: after first tap"];

    //SLButton *unfavoriteButton = [SLButton elementWithAccessibilityLabel:@"Unfavorite"];
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"favorite button is not valid and visible after first time tapping");
    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"on"], @"Favorite button does not has ax value of on");
    [UIAElement(favoriteButton) tap];

    [self wait:1];

    SLAssertTrue([UIAElement(favoriteButton.value) isEqualToString:@"off"], @"favorite button is not off at end of test");
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: ending"];


    [[SLDevice currentDevice] captureScreenshotWithFilename:@"end of test"];


    SLLogAsync(@"testing");
    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton description is %@", [favoriteButton slAccessibilityDescription]);
    SLLogAsync(@"favoriteButton parent is %@", [favoriteButton slAccessibilityParent]);
    SLLogAsync(@"favoriteButton recursive description is %@", [favoriteButton slRecursiveAccessibilityDescription]);
    SLLogAsync(@"now log element tree for favorite button");
    [favoriteButton logElementTree];


}

@end
