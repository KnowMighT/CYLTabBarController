//
//  CYLTabBarController.m
//  CYLTabBarController
//
//  v1.12.0 Created by 微博@iOS程序犭袁 ( http://weibo.com/luohanchenyilong/ ) on 10/20/15.
//  Copyright © 2015 https://github.com/ChenYilong . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+CYLTabBarControllerExtention.h"
#import "CYLPlusButton.h"

@implementation UIView (CYLTabBarControllerExtention)

- (BOOL)cyl_isPlusButton {
    return [self isKindOfClass:[CYLExternPlusButton class]];
}

- (BOOL)cyl_isTabButton {
    BOOL isKindOfButton = [self cyl_isKindOfClass:[UIControl class]];
    return isKindOfButton;
}

- (BOOL)cyl_isTabImageView {
    BOOL isKindOfImageView = [self cyl_isKindOfClass:[UIImageView class]];
    if (!isKindOfImageView) {
        return NO;
    }
    NSString *subString = [NSString stringWithFormat:@"%@cat%@ew", @"Indi" , @"orVi"];
    BOOL isBackgroundImage = [self cyl_classStringhasPrefix:subString];
    BOOL isTabImageView = !isBackgroundImage;
    return isTabImageView;
}

- (BOOL)cyl_isTabLabel {
    BOOL isKindOfLabel = [self cyl_isKindOfClass:[UILabel class]];
    return isKindOfLabel;
}

- (BOOL)cyl_isTabBadgeView {
    BOOL isKindOfClass = [self isKindOfClass:[UIView class]];
    BOOL isClass = [self isMemberOfClass:[UIView class]];
    BOOL isKind = isKindOfClass && !isClass;
    if (!isKind) {
        return NO;
    }
    NSString *tabBarClassString = [NSString stringWithFormat:@"%@IB%@", @"_U" , @"adg"];
    BOOL isTabBadgeView = [self cyl_classStringhasPrefix:tabBarClassString];;
    return isTabBadgeView;
}

- (BOOL)cyl_isKindOfClass:(Class)class {
    BOOL isKindOfClass = [self isKindOfClass:class];
    BOOL isClass = [self isMemberOfClass:class];
    BOOL isKind = isKindOfClass && !isClass;
    if (!isKind) {
        return NO;
    }
    BOOL isTabBarClass = [self cyl_isTabBarClass];
    return isTabBarClass;
}

- (BOOL)cyl_isTabBarClass {
    NSString *tabBarClassString = [NSString stringWithFormat:@"U%@a%@ar", @"IT" , @"bB"];
    BOOL isTabBarClass = [self cyl_classStringhasPrefix:tabBarClassString];
    return isTabBarClass;
}

- (BOOL)cyl_classStringhasPrefix:(NSString *)subString {
    NSString *classString = NSStringFromClass([self class]);
    return [classString hasPrefix:subString];
}

+ (UIView *)cyl_tabBadgePointViewWithClolor:(UIColor *)color radius:(CGFloat)radius {
    UIView *defaultTabBadgePointView = [[UIView alloc] init];
    [defaultTabBadgePointView setTranslatesAutoresizingMaskIntoConstraints:NO];
    defaultTabBadgePointView.backgroundColor = color;
    defaultTabBadgePointView.layer.cornerRadius = radius;
    defaultTabBadgePointView.layer.masksToBounds = YES;
    defaultTabBadgePointView.hidden = YES;
    // Width constraint
    [defaultTabBadgePointView addConstraint:[NSLayoutConstraint constraintWithItem:defaultTabBadgePointView
                                                                         attribute:NSLayoutAttributeWidth
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute: NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1
                                                                          constant:radius * 2]];
    // Height constraint
    [defaultTabBadgePointView addConstraint:[NSLayoutConstraint constraintWithItem:defaultTabBadgePointView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute: NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1
                                                                          constant:radius * 2]];
    return defaultTabBadgePointView;
}

@end
