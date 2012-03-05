//
//  ViewController.m
//  PieChart
//
//  Created by Westin Newell on 3/4/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import "ViewController.h"
#import "PieProgressView.h"

@implementation ViewController
@synthesize pieProgressView = _pieProgressView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)widthSliderValueChanged:(UISlider*)sender 
{
    self.pieProgressView.progressWidth = sender.value;
}

- (IBAction)progressSliderValueChanged:(UISlider*)sender 
{
    self.pieProgressView.percentFilled = sender.value;
}

- (void)dealloc {
    [self setPieProgressView:nil];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setPieProgressView:nil];
    [super viewDidUnload];
}
@end
