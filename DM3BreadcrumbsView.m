//
//  DM3BreadcrumbsView.m
//  DM3Collection
//
//  Created by Dmitry Beloborodov on 27/02/2017.
//  Copyright © 2017 Dmitry Beloborodov. All rights reserved.
//

#import "DM3BreadcrumbsView.h"

@interface DM3BreadcrumbsView ()

@end

@implementation DM3BreadcrumbsView

- (void)setDefaultValues {
    if (!self.leftLineColor) {
        self.leftLineColor = [UIColor grayColor];
    }

    if (!self.rightLineColor) {
        self.rightLineColor = [UIColor grayColor];
    }

    if (!self.circleColor) {
        self.circleColor = [UIColor grayColor];
    }

    if (!self.lineHeight) {
        self.lineHeight = 3.0f;
    }

    if (!self.circleDiametr) {
        self.circleDiametr = 10.0f;
    }
}

- (void)drawRect:(CGRect)rect {

    [self setDefaultValues];

    // LEFT LINE
    UIBezierPath *leftLinePath = [UIBezierPath bezierPath];
    CGPoint leftLineStartPoint = CGPointMake(0, CGRectGetMidY(self.bounds));
    [leftLinePath moveToPoint:leftLineStartPoint];
    CGPoint leftLineEndPoing = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [leftLinePath addLineToPoint:leftLineEndPoing];

    leftLinePath.lineWidth = self.lineHeight;
    [self.leftLineColor setStroke];
    [leftLinePath fill];
    [leftLinePath stroke];

    // RIGHT LINE
    UIBezierPath *rightLinePath = [UIBezierPath bezierPath];
    [rightLinePath moveToPoint:leftLineEndPoing];
    CGPoint rightLineEndPoing = CGPointMake(self.bounds.size.width, CGRectGetMidY(self.bounds));
    [rightLinePath addLineToPoint:rightLineEndPoing];

    rightLinePath.lineWidth = self.lineHeight;
    [self.rightLineColor setStroke];
    [rightLinePath fill];
    [rightLinePath stroke];

    // CIRCLE
    int radius = self.circleDiametr / 2;
    CGRect circleRect =  CGRectMake(CGRectGetMidX(self.bounds) - radius,
                                    CGRectGetMidY(self.bounds) - radius,
                                    self.circleDiametr,
                                    self.circleDiametr);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:circleRect];
    [self.circleColor setStroke];
    [self.circleColor setFill];

    CGContextRef context = UIGraphicsGetCurrentContext();

    if (self.circleShouldGlow) {
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, CGSizeZero, self.circleDiametr / 3, self.circleColor.CGColor);
    }
    [circlePath fill];
    [circlePath stroke];

    if (self.circleShouldGlow) {
        CGContextRestoreGState(context);
    }
}


@end
