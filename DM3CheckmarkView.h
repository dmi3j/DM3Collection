//
// DM3CheckmarkView.h
// DM3CheckmarkView
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DM3CheckmarkView : UIView

@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic, strong) UIColor *checkmarkColor;
@property (nonatomic) double animationDuration;

- (void)animateCheckmark;
- (void)clearDrawing;

@end
