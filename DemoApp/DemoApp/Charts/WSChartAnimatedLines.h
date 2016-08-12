//
//  WSChartAnimatedLines.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/7/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartScientificFitLines.h"

/// This shows a cyclic animation sequence of the scientific lines chart.
@interface WSChartAnimatedLines : WSChartScientificFitLines

/// Keep a reference to the chart to simplify animating it.
@property (nonatomic, strong) WSChart *formFactorChart;

@end
