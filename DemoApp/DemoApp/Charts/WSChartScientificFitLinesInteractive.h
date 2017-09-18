//
//  WSChartScientificFitLinesInteractive.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartScientificFitLines.h"

/// This chart is an extension of @p WSChartScientificFitLines. It adds
/// the zooming and panning gestures and allows selecting individual data
/// points.
@interface WSChartScientificFitLinesInteractive : WSChartScientificFitLines <WSControllerGestureDelegate>

@end
