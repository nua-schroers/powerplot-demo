//
//  WSChartScientificLines.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartScientificLines.h"
#import "WSDemoData.h"

@implementation WSChartScientificLines

- (NSString *)title
{
    return NSLocalizedString(@"Scientific Data Points", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A line chart with different styles", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Our test data.
    WSData *testD = [WSDemoData scientificData];

    // Manually configure the first chart and store it in self.allLineCharts[0].
    // This demonstrates how widely a data plot can be configured.
    WSChart *lineChart = [[WSChart alloc] initWithFrame:frame];

    // First, set up and configure the axis.
    WSPlotAxis *axis = [[WSPlotAxis alloc] initWithFrame:frame];
    axis.axisX.axisStyle = kAxisArrowFilledHead;
    axis.axisY.axisStyle = kAxisArrowFilledHead;
    axis.axisX.labelStyle = kLabelInside;
    axis.axisX.axisLabel = NSLocalizedString(@"Crystal orientation", @"");
    axis.axisY.labelStyle = kLabelInside;
    axis.axisY.axisLabel = NSLocalizedString(@"Energy output", @"");
    axis.axisColor = [UIColor blackColor];
    axis.ticksX.ticksDir = kTDirectionInOut;
    axis.ticksY.ticksDir = kTDirectionInOut;
    axis.gridColor = [UIColor grayColor];
    axis.gridStrokeWidth = 1.0;
    axis.axisX.gridStyle = kGridDotted;
    axis.axisY.gridStyle = kGridDotted;

    // Next, set up and configure the lines.
    WSPlotData *lines = [[WSPlotData alloc] initWithFrame:frame];
    lines.propDefault.symbolSize = 15.0;
    lines.propDefault.symbolStyle = kSymbolSquare;
    lines.propDefault.symbolColor = [UIColor greenColor];
    lines.propDefault.errorStyle = kErrorXYCapped;
    lines.lineStyle = kLineRegular;
    lines.dashStyle = kDashingDashed;
    lines.intStyle = kInterpolationStraight;
    lines.shadowEnabled = YES;
    lines.shadowScale = 5.0;
    lines.shadowColor = [UIColor blackColor];

    // Then add two @p WSPlotController objects: one that handles the axis,
    // the other that handles the lines.
    WSPlotController *axisController = [[WSPlotController alloc] init];
    WSPlotController *linesController = [[WSPlotController alloc] init];
    axisController.view = axis;
    linesController.view = lines;
    axisController.dataD = testD;
    linesController.dataD = testD;
    [lineChart addPlot:axisController];
    [lineChart addPlot:linesController];
    [lineChart autoscaleAllAxisX];
    [lineChart autoscaleAllAxisY];

    // Finally, set the axis ticks and locations (this should be done only
    // after the data is available to @p WSPlotAxis).
    [axis autoTicksXD];
    [axis autoTicksYD];
    [axis setTickLabelsX];
    [axis setTickLabelsY];
    axis.ticksX.ticksStyle = kTicksLabelsSlanted;
    axis.ticksY.ticksStyle = kTicksLabelsSlanted;

    return lineChart;
}

@end
