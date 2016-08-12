//
//  WSChartAnnotatedPoints.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 4/6/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartGenerator.h"

/// This chart is an example of charts with points. Basically, a chart
/// with points is a line chart without lines. In addition, this chart
/// has annotations on the points which illustrates how to add custom
/// labels at the coordinates of data points in a @p WSChart.
@interface WSChartAnnotatedPoints : WSChartGenerator <WSPlotCustomViewDataSource>

@end

