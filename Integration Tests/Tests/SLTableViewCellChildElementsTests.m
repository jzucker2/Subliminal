//
//  SLTableViewCellChildElementsTests.m
//  Subliminal
//
//  Created by Jordan Zucker on 3/13/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLIntegrationTest.h"
#import <Subliminal/SLTerminal.h>

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

- (void)testOriginalHackMatchingTableViewCell
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

    SLLogAsync(@"favoriteButton isValidAndVisible is %d", [favoriteButton isValidAndVisible]);
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

- (void)testSecondHackMatchingTableViewCell
{
    [[SLWindow mainWindow] logElementTree];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"start"];
    __block BOOL firstMatch = NO;

//    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:YES];
    SLElement *favoriteButton = [SLElement elementMatching:^BOOL(NSObject *obj) {

//        if ([obj.accessibilityLabel isEqualToString:@"Favorite"]) {
//            id accessibilityParent = [obj slAccessibilityParent];
//            if (accessibilityParent && [accessibilityParent isKindOfClass:[UITableViewCell class]]) {
//                return [[accessibilityParent accessibilityLabel] isEqualToString:@"Cell 2"];
//            }

        id accessibilityParent = [obj slAccessibilityParent];

//        //SLLogAsync(@"starting: accessibilityParent is %@", accessibilityParent);
//        while (accessibilityParent && ![NSStringFromClass([accessibilityParent class]) isEqualToString:@"UITableViewCellAccessibilityElement"]) {
//
//            accessibilityParent = [accessibilityParent slAccessibilityParent];
//            //SLLogAsync(@"get accessibilityParent that is now %@", accessibilityParent);
//
//        }
        if (accessibilityParent && [NSStringFromClass([accessibilityParent class]) isEqualToString:@"UITableViewCellAccessibilityElement"]) {
            if ([[accessibilityParent accessibilityLabel] isEqualToString:@"Cell 2"]) {
                if (firstMatch == NO) {
                    firstMatch = YES;
                    return NO;
                }
                else {
                    firstMatch = NO;
                    return YES;
                }
            }
        }


        return NO;

    } withDescription:@"searching for favoritebutton"];

    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    NSString *favoriteButtonValue = [favoriteButton value];
    SLLogAsync(@"favoriteButtonValue is :%@", favoriteButtonValue);

    SLLogAsync(@"check at start");
    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton description is %@", [favoriteButton slAccessibilityDescription]);
    SLLogAsync(@"favoriteButton parent is %@", [favoriteButton slAccessibilityParent]);
    SLLogAsync(@"favoriteButton recursive description is %@", [favoriteButton slRecursiveAccessibilityDescription]);
    SLLogAsync(@"now log element tree for favorite button");

    SLLogAsync(@"favoriteButton isValidAndVisible is %d", [favoriteButton isValidAndVisible]);
    SLLogAsync(@"favoriteButton isValid is %d", [favoriteButton isValid]);
    SLLogAsync(@"favoriteButton isVisible is %d", [favoriteButton isVisible]);
    SLAssertTrue([favoriteButtonValue isEqualToString:@"off"], @"favorite button is not originally off");
    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: starting"];

    [UIAElement(favoriteButton) tap];

    [self wait:1];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"after tap"];
    [favoriteButton captureScreenshotWithFilename:@"fb: after first tap"];

    //SLButton *unfavoriteButton = [SLButton elementWithAccessibilityLabel:@"Unfavorite"];
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"favorite button is not valid and visible after first time tapping");
    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"on"], @"Favorite button does not has ax value of on");
    [UIAElement(favoriteButton) tap];

    [self wait:1];

    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"off"], @"favorite button is not off at end of test");
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

//    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:NO];

    
}

- (void)testMethodMatchingTableViewCell
{
    [[SLWindow mainWindow] logElementTree];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"start"];

//    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:YES];
    SLElement *favoriteButton = [SLElement elementWithLabel:@"Favorite" andValue:nil andTraits:UIAccessibilityTraitButton insideTableViewCellWithLabel:@"Cell 2" andValue:nil];

    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    NSString *favoriteButtonValue = [favoriteButton value];
    SLLogAsync(@"favoriteButtonValue is :%@", favoriteButtonValue);

    SLLogAsync(@"check at start");
    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton description is %@", [favoriteButton slAccessibilityDescription]);
    SLLogAsync(@"favoriteButton parent is %@", [favoriteButton slAccessibilityParent]);
    SLLogAsync(@"favoriteButton recursive description is %@", [favoriteButton slRecursiveAccessibilityDescription]);
    SLLogAsync(@"now log element tree for favorite button");

    SLLogAsync(@"favoriteButton isValidAndVisible is %d", [favoriteButton isValidAndVisible]);
    SLLogAsync(@"favoriteButton isValid is %d", [favoriteButton isValid]);
    SLLogAsync(@"favoriteButton isVisible is %d", [favoriteButton isVisible]);
    SLAssertTrue([favoriteButtonValue isEqualToString:@"off"], @"favorite button is not originally off");
//    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: starting"];

    [UIAElement(favoriteButton) tap];

    [self wait:1];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"after tap"];
    [favoriteButton captureScreenshotWithFilename:@"fb: after first tap"];

    //SLButton *unfavoriteButton = [SLButton elementWithAccessibilityLabel:@"Unfavorite"];
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"favorite button is not valid and visible after first time tapping");
    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"on"], @"Favorite button does not has ax value of on");
    [UIAElement(favoriteButton) tap];

    [self wait:1];

    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"off"], @"favorite button is not off at end of test");
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
    
//    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:NO];

    
}

- (void)testMethodMatchingTableViewCell2
{
    [[SLWindow mainWindow] logElementTree];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"start"];

    //    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:YES];
    SLElement *favoriteButton = [SLElement elementWithLabel:@"Favorite" andValue:nil andTraits:UIAccessibilityTraitButton insideTableViewCellWithLabel:@"Cell 1" andValue:nil];

    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    SLLogAsync(@"favoriteButton value is %@", [favoriteButton value]);
    NSString *favoriteButtonValue = [favoriteButton value];
    SLLogAsync(@"favoriteButtonValue is :%@", favoriteButtonValue);

    SLLogAsync(@"check at start");
    SLLogAsync(@"favoriteButton is %@", favoriteButton);
    SLLogAsync(@"favoriteButton description is %@", [favoriteButton slAccessibilityDescription]);
    SLLogAsync(@"favoriteButton parent is %@", [favoriteButton slAccessibilityParent]);
    SLLogAsync(@"favoriteButton recursive description is %@", [favoriteButton slRecursiveAccessibilityDescription]);
    SLLogAsync(@"now log element tree for favorite button");

    SLLogAsync(@"favoriteButton isValidAndVisible is %d", [favoriteButton isValidAndVisible]);
    SLLogAsync(@"favoriteButton isValid is %d", [favoriteButton isValid]);
    SLLogAsync(@"favoriteButton isVisible is %d", [favoriteButton isVisible]);
    SLAssertTrue([favoriteButtonValue isEqualToString:@"off"], @"favorite button is not originally off");
    //    SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"Favorite button is not valid and visible");
    [favoriteButton captureScreenshotWithFilename:@"fb: starting"];

    [UIAElement(favoriteButton) tap];

    [self wait:1];
    [[SLDevice currentDevice] captureScreenshotWithFilename:@"after tap"];
    [favoriteButton captureScreenshotWithFilename:@"fb: after first tap"];

    //SLButton *unfavoriteButton = [SLButton elementWithAccessibilityLabel:@"Unfavorite"];
    //SLAssertTrue([UIAElement(favoriteButton) isValidAndVisible], @"favorite button is not valid and visible after first time tapping");
    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"on"], @"Favorite button does not has ax value of on");
    [UIAElement(favoriteButton) tap];

    [self wait:1];

    SLAssertTrue([[UIAElement(favoriteButton) value] isEqualToString:@"off"], @"favorite button is not off at end of test");
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

    //    [[SLTerminal sharedTerminal] setScriptLoggingEnabled:NO];
    
    
}


@end
