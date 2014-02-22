//
//  SLNavigationBarTestViewController.m
//  Subliminal
//
//  Created by Jordan Zucker on 2/21/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLTestCaseViewController.h"

@interface SLNavigationBarTestViewController : SLTestCaseViewController

@end

@interface SLNavigationBarTestViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end

@implementation SLNavigationBarTestViewController

+ (NSString *)nibNameForTestCase:(SEL)testCase {
    return @"SLNavigationBarTestViewController";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _navigationBar.isAccessibilityElement = YES;
    _navigationBar.accessibilityLabel = @"navigationBar";
}

@end
