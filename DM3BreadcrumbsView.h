//
//  DM3BreadcrumbsView.h
//  DM3Collection
//
//  Created by Dmitry Beloborodov on 27/02/2017.
//  Copyright © 2017 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DM3BreadcrumbsView : UIView

@property (nonatomic, strong) UIColor *leftLineColor;
@property (nonatomic, strong) UIColor *rightLineColor;
@property (nonatomic, strong) UIColor *circleColor;
@property (nonatomic) CGFloat lineHeight;
@property (nonatomic) CGFloat circleDiametr;
@property (nonatomic) BOOL circleShouldGlow;

@end
