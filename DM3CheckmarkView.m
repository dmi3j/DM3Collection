//
// DM3CheckmarkView.m
// DM3CheckmarkView
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "DM3CheckmarkView.h"

@interface DM3CheckmarkView ()

@property BOOL shouldAnimateDrawing;

@property CAShapeLayer *circleLayer;
@property CAShapeLayer *checkmarkLayer;

@end

@implementation DM3CheckmarkView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configureLayers];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configureLayers];
}

- (void)configureLayers {
    self.circleLayer = [CAShapeLayer layer];
    self.checkmarkLayer = [CAShapeLayer layer];
}

- (void)setDefaultValues {

    if (!self.circleColor) {
        self.circleColor = [UIColor colorWithRed:46.0f / 255.0f green:204.0f / 255.0f blue:113.0f / 255.0f alpha:1.0];
    }

    if (!self.checkmarkColor) {
        self.checkmarkColor = [UIColor whiteColor];
    }

    if (!self.animationDuration) {
        self.animationDuration = 0.8;
    }
}
- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self setDefaultValues];

    CGFloat diametr = 0.98 * MIN(self.bounds.size.width, self.bounds.size.height);
    CGFloat radius = diametr / 2;

    [self clearDrawing];

    self.circleLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius, 2.0 * radius)
                                                       cornerRadius:radius].CGPath;
    self.circleLayer.position = CGPointMake(CGRectGetMidX(self.bounds) - radius,
                                            CGRectGetMidY(self.bounds) - radius);
    self.circleLayer.fillColor = self.circleColor.CGColor;
    self.circleLayer.strokeColor = self.circleColor.CGColor;
    self.circleLayer.lineWidth = 1;

    [self.layer addSublayer:self.circleLayer];

    UIBezierPath *checkMarkPath = [UIBezierPath bezierPath];
    CGPoint viewCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint p1 = CGPointMake(viewCenter.x - (radius * 0.6), viewCenter.y);
    CGPoint p2 = CGPointMake(viewCenter.x - (radius * 0.2), viewCenter.y + (radius * 0.4));
    CGPoint p3 = CGPointMake(viewCenter.x + (radius * 0.6), viewCenter.y - (radius * 0.4));
    [checkMarkPath moveToPoint:p1];
    [checkMarkPath addLineToPoint:p2];
    [checkMarkPath addLineToPoint:p3];
    self.checkmarkLayer.path = checkMarkPath.CGPath;
    self.checkmarkLayer.strokeColor = self.checkmarkColor.CGColor;
    self.checkmarkLayer.fillColor = nil;
    self.checkmarkLayer.lineWidth = diametr / 10.0f;
    self.checkmarkLayer.lineJoin = kCALineCapSquare;

    [self.layer addSublayer:self.checkmarkLayer];

    if (self.shouldAnimateDrawing) {
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = self.animationDuration;
        pathAnimation.fromValue = @0;
        pathAnimation.toValue = @1;
        pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.checkmarkLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
        self.shouldAnimateDrawing = NO;
    }
}

#pragma mark - Public API

- (void)animateCheckmark {
    self.shouldAnimateDrawing = YES;
    [self setNeedsDisplay];
}

- (void)clearDrawing {
    [self.circleLayer removeFromSuperlayer];
    [self.checkmarkLayer removeFromSuperlayer];
}

@end
