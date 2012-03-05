//
//  PieProgressView.m
//
//  Created by Westin Newell on 3/4/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import "PieProgressView.h"

@interface PieProgressView ()

@property (nonatomic, assign) CGGradientRef gradient;

-(CGGradientRef)gradient;

@end

@implementation PieProgressView

@synthesize gradient = _gradient;
@synthesize percentFilled = _percentFilled;
@synthesize progressWidth = _progressWidth;
@synthesize colorsArray = _colorsArray;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.percentFilled = 0;
        self.progressWidth = 0.5;
        self.colorsArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.3f green:0.3f blue:0.7f alpha:1.0f], [UIColor colorWithRed:0.5f green:0.5f blue:0.9f alpha:1.0f], nil];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    
    CGFloat minDimension = self.bounds.size.height;
    if ( self.bounds.size.height >= self.bounds.size.width ) {
        minDimension = self.bounds.size.width;
    }
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:startPoint radius:self.bounds.size.width / 2 startAngle:-0.5 * M_PI endAngle:(-0.5 + self.percentFilled * 2) * M_PI clockwise:YES];
    [path addLineToPoint:startPoint];
    [path closePath];
    [path addClip];
    
    CGContextDrawRadialGradient(ctx, [self gradient], startPoint, minDimension / 2 *  ( 1 - self.progressWidth), startPoint, minDimension / 2, 0);
}

- (CGGradientRef)gradient {
    if ( _gradient == nil ) {
        UIColor *firstColor = (UIColor*)[self.colorsArray objectAtIndex:0];
        UIColor *secondColor = (UIColor*)[self.colorsArray lastObject];
        const float* colorOne = CGColorGetComponents(firstColor.CGColor);
        const float* colorTwo = CGColorGetComponents(secondColor.CGColor);
        CGFloat colors[8] = {
            colorOne[0], colorOne[1], colorOne[2], colorOne[3],
            colorTwo[0], colorTwo[1], colorTwo[2], colorTwo[3]};
        CGFloat locations[2] = {0, 1};
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        _gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, 2);
        
        CGColorSpaceRelease(colorSpace);
    }
    return _gradient;
}

- (void)setPercentFilled:(CGFloat)percentFilled {
    if ( percentFilled > 1 ) {
        percentFilled = 1;
    }
    else if ( percentFilled < 0 ) {
        percentFilled = 0;
    }
    _percentFilled = percentFilled;
    [self setNeedsDisplay];
}

- (void)setProgressWidth:(CGFloat)progressWidth {
    if ( progressWidth > 1 ) {
        progressWidth = 1;
    }
    else if ( progressWidth < 0 ) {
        progressWidth = 0;
    }
    _progressWidth = progressWidth;
    [self setNeedsDisplay];
}

- (void)setColorsArray:(NSArray *)colorsArray
{
    if (colorsArray != _colorsArray)
    {
        [colorsArray retain];
        [_colorsArray release];
        _colorsArray = colorsArray;
        
        _gradient = nil;
        
        [self setNeedsDisplay];
    }
}

- (void)dealloc {
    self.colorsArray = nil;
    [super dealloc];
}

@end
