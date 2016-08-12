//
//  WSChartContourRegion.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartContourRegion.h"
#import "WSDemoData.h"

@implementation WSChartContourRegion

- (NSString *)title
{
    return NSLocalizedString(@"Contour Region", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"Data points with two contour regions", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Step 1: Create the chart with data points and coordinate axis.
    WSChart *contourChart = [WSChart linePlotWithFrame:frame
                                                  data:[WSDemoData scatteredPoints]
                                                 style:kChartLineScientific
                                             axisStyle:kCSPlain
                                                colors:kColorLight
                                                labelX:NSLocalizedString(@"x", @"")
                                                labelY:NSLocalizedString(@"y", @"")];
    WSPlotData *dataPlot = (WSPlotData *)contourChart[0].view;
    dataPlot.style = kCustomStyleUnified;
    dataPlot.lineStyle = kLineNone;
    dataPlot.propDefault.symbolStyle = kSymbolTriangleLeft;
    dataPlot.propDefault.symbolSize = 5.0;

    // Step 2: Add a contour region.
    [contourChart generateControllerWithData:[WSDemoData centerRegion]
                                   plotClass:[WSPlotRegion class]
                                       frame:frame];
    ((WSPlotRegion *)[contourChart lastPlot].view).fillColor = UICOLORRGB(60, 60, 100);

    // Step 3: Add another contour region.
    [contourChart generateControllerWithData:[WSDemoData centerRegionWide]
                                   plotClass:[WSPlotRegion class]
                                       frame:frame];
    ((WSPlotRegion *)[contourChart lastPlot].view).fillColor = UICOLORRGB(80, 80, 100);

    // Ensure proper ordering of plots.
    [contourChart sendPlotToBack:[contourChart lastPlot]];

    // Finally, rescale all axis.
    [contourChart autoscaleAllAxisX];
    [contourChart autoscaleAllAxisY];

    return contourChart;
}

@end
