//
//  DemoBreadcrumbController.m
//  DM3Collection
//
//  Created by Dmitry Beloborodov on 27/02/2017.
//  Copyright © 2017 Dmitry Beloborodov. All rights reserved.
//

#import "DemoBreadcrumbController.h"

#import "DM3BreadcrumbsView.h"

@interface DemoBreadcrumbController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *hiddenTextView;
@property (weak, nonatomic) IBOutlet DM3BreadcrumbsView *bc1;
@property (weak, nonatomic) IBOutlet DM3BreadcrumbsView *bc2;
@property (weak, nonatomic) IBOutlet DM3BreadcrumbsView *bc3;
@property (weak, nonatomic) IBOutlet DM3BreadcrumbsView *bc4;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@property (nonatomic) int currentStep;

@end

@implementation DemoBreadcrumbController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.hiddenTextView becomeFirstResponder];

    [self updateBreadcrumbs];
}

- (IBAction)stepperDidPressed:(UIStepper *)sender {
    [self updateBreadcrumbs];
}

- (void)markView:(DM3BreadcrumbsView *)breadcrumbsView completed:(BOOL)completed full:(BOOL)full {

    breadcrumbsView.clearsContextBeforeDrawing = YES;
    if (completed) {
        breadcrumbsView.circleColor = [UIColor redColor];
        breadcrumbsView.leftLineColor = [UIColor redColor];
        if (full) {
            breadcrumbsView.circleShouldGlow = NO;
            breadcrumbsView.rightLineColor = [UIColor redColor];
            breadcrumbsView.circleDiametr = 20.0f;
        } else {
            breadcrumbsView.circleShouldGlow = YES;
            breadcrumbsView.circleDiametr = 25.0f;
            breadcrumbsView.rightLineColor = [UIColor grayColor];
        }
    } else {
        breadcrumbsView.circleColor = [UIColor grayColor];
        breadcrumbsView.circleShouldGlow = NO;
        breadcrumbsView.circleDiametr = 20.0f;
        breadcrumbsView.leftLineColor = [UIColor grayColor];
        breadcrumbsView.rightLineColor = [UIColor grayColor];
    }
}

- (void)updateBreadcrumbs {

    if (self.stepper.value >= 1) {
        [self markView:self.bc1 completed:YES full:NO];
    } else {
        [self markView:self.bc1 completed:NO full:NO];
    }

    if (self.stepper.value >= 2) {
        [self markView:self.bc1 completed:YES full:YES];
        [self markView:self.bc2 completed:YES full:NO];
    } else {
        [self markView:self.bc2 completed:NO full:NO];
    }

    if (self.stepper.value >= 3) {
        [self markView:self.bc2 completed:YES full:YES];
        [self markView:self.bc3 completed:YES full:NO];
    } else {
        [self markView:self.bc3 completed:NO full:NO];
    }

    if (self.stepper.value >= 4) {
        [self markView:self.bc3 completed:YES full:YES];
        [self markView:self.bc4 completed:YES full:YES];
        self.bc4.circleShouldGlow = YES;
        self.bc4.circleDiametr = 25.0f;
    } else {
        [self markView:self.bc4 completed:NO full:NO];
    }

    [self.bc1 setNeedsDisplay];
    [self.bc2 setNeedsDisplay];
    [self.bc3 setNeedsDisplay];
    [self.bc4 setNeedsDisplay];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];

    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]

    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {

        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.

    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {

        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]

        [self updateBreadcrumbs];
    }];
}

@end
