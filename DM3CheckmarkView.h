//
// DM3CheckmarkView.h
// DM3CheckmarkView
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DM3CheckmarkView : UIView

@property (nonatomic, strong) IBInspectable UIColor *circleColor;
@property (nonatomic, strong) IBInspectable UIColor *checkmarkColor;
@property (nonatomic) IBInspectable double animationDuration;

- (void)animateCheckmark;
- (void)clearDrawing;

@end
