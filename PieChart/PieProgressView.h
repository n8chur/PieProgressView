//
//  PieProgressView.h
//
//  Created by Westin Newell on 3/4/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieProgressView : UIView

/*
 The width of the progress slider as a percent.
 */
@property (nonatomic, assign) CGFloat progressWidth;

/*
 The progress amount as a percentage.
 */
@property (nonatomic, assign) CGFloat progress;

/*
 The array of one or two UIColor's to use for the radial gradient over the progress.
 */
@property (nonatomic, retain) NSArray* colorsArray;

@end
