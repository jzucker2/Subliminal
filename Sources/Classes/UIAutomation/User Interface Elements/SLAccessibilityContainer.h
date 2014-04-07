//
//  SLAccessibilityContainer.h
//  Subliminal
//
//  Created by Jordan Zucker on 4/2/14.
//  Copyright (c) 2014 Inkling. All rights reserved.
//

#import "SLElement.h"

typedef NS_ENUM(NSInteger, SLAccessibilityContainerType) {
    SLAccessibilityContainerTypeTableViewCell,
    SLAccessibilityContainerTypeCollectionViewCell,
    SLAccessibilityContainerTypeNavigationBar,
    SLAccessibilityContainerTypeToolbar,
    SLAccessibilityContainerTypeTabBar
};

@interface SLAccessibilityContainer : SLElement

@property (nonatomic, assign) SLAccessibilityContainerType containerType;

+ (instancetype)containerWithElement:(SLElement *)element andContainerType:(SLAccessibilityContainerType)accessibilityContainerType;

+ (instancetype)containerWithIdentifier:(NSString *)identifer andContainerType:(SLAccessibilityContainerType)accessibilityContainerType;
+ (instancetype)containerWithLabel:(NSString *)label andContainerType:(SLAccessibilityContainerType)accessibilityContainerType;
+ (instancetype)containerWithLabel:(NSString *)label value:(NSString *)value traits:(UIAccessibilityTraits)traits andContainerType:(SLAccessibilityContainerType)accessibilityContainerType;

- (id)childElementMatching:(SLElement *)childElement;
+ (id)childElementMatching:(SLElement *)childElement inContainerElement:(SLElement *)containerElement ofContainerType:(SLAccessibilityContainerType)accessibilityContainerType;

@end
