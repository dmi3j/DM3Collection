//
// DemoCheckmarkController.m
// DM3Collection
//
// Created by Dmitry Beloborodov on 26/05/16.
// Copyright © 2016 Dmitry Beloborodov. All rights reserved.
//

#import "DemoCheckmarkController.h"
#import "DM3CheckmarkView.h"

@interface DemoCheckmarkController ()

@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView1;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView2;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView3;
@property (weak, nonatomic) IBOutlet DM3CheckmarkView *checkmarkView4;

@end

@implementation DemoCheckmarkController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.checkmarkView2.animationDuration = 0.5f;
    self.checkmarkView3.animationDuration = 2.5f;
    self.checkmarkView4.animationDuration = 0.8f;

    self.checkmarkView2.circleColor = [UIColor magentaColor];
    self.checkmarkView3.circleColor = [UIColor lightGrayColor];
    self.checkmarkView4.circleColor = [UIColor orangeColor];

    self.checkmarkView4.checkmarkColor = [UIColor blackColor];
}

- (IBAction)animateButtonPressed:(UIButton *)sender {

    [self.checkmarkView1 animateCheckmark];
    [self.checkmarkView2 animateCheckmark];
    [self.checkmarkView3 animateCheckmark];
    [self.checkmarkView4 animateCheckmark];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    [self.checkmarkView1 clearDrawing];
    [self.checkmarkView2 clearDrawing];
    [self.checkmarkView3 clearDrawing];
    [self.checkmarkView4 clearDrawing];

    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {

        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.

    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {

        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]

        [self animateButtonPressed:nil];
    }];
}

@end
