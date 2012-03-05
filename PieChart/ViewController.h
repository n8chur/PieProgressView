//
//  ViewController.h
//  PieChart
//
//  Created by Westin Newell on 3/4/12.
//  Copyright (c) 2012 n8chur. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PieProgressView;

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet PieProgressView *pieProgressView;

- (IBAction)widthSliderValueChanged:(UISlider*)sender;

- (IBAction)progressSliderValueChanged:(UISlider*)sender;

@end
