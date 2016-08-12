//
//  WSChartMixedAnimated.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartGenerator.h"

/// This chart shows a mixed bar/line chart that are simultaneously animated.
@interface WSChartMixedAnimated : WSChartGenerator

/// Keep a reference to the chart to simplify animating it.
@property (nonatomic, strong) WSChart *chart;

/// The segmented control.
@property (nonatomic, strong) IBOutlet UISegmentedControl *selector;

/// The associated action.
- (IBAction)toggleSwitch:(UISegmentedControl *)sender;

/// Two data sets: one for the bars (projectCost) and one for the lines
/// (totalProfit).
@property (nonatomic, strong) WSData *projectCost;
@property (nonatomic, strong) WSData *totalProfit;

@end
