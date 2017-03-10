//
//  DM3BreadcrumbsView.h
//  DM3Collection
//
//  Created by Dmitry Beloborodov on 27/02/2017.
//  Copyright © 2017 Dmitry Beloborodov. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DM3BreadcrumbsView : UIView

@property (nonatomic, strong) IBInspectable UIColor *leftLineColor;
@property (nonatomic, strong) IBInspectable UIColor *rightLineColor;
@property (nonatomic, strong) IBInspectable UIColor *circleColor;
@property (nonatomic) IBInspectable CGFloat lineHeight;
@property (nonatomic) IBInspectable CGFloat circleDiametr;
@property (nonatomic) IBInspectable BOOL circleShouldGlow;

@end
