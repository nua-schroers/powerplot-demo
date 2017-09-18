//
//  WSChartScientificFitLines.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartScientificFitLines.h"
#import "WSDemoData.h"

@implementation WSChartScientificFitLines

- (NSString *)title
{
    return NSLocalizedString(@"Scientific Fit", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A combination of multiple elements", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Step 1: Basic chart with coordinate system and data points with uncertainties.
    WSChart *formFactorChart = [WSChart linePlotWithFrame:frame
                                                     data:[WSDemoData formFactorMeasured]
                                                    style:kChartLineScientific
                                                axisStyle:kCSArrows
                                                   colors:kColorLight
                                                   labelX:NSLocalizedString(@"Virtuality", @"")
                                                   labelY:NSLocalizedString(@"F1 form factor", @"")];
    WSPlotData *dataPlot = (WSPlotData *)formFactorChart[0].view;
    dataPlot.lineStyle = kLineNone;
    dataPlot.propDefault.symbolStyle = kSymbolDiamond;
    dataPlot.propDefault.symbolSize = 10;

    // Step 2: The best fit line.
    [formFactorChart generateControllerWithData:[WSDemoData formFactorFit]
                                      plotClass:[WSPlotData class]
                                          frame:frame];
    WSPlotData *bestFit = (WSPlotData *)[formFactorChart lastPlot].view;
    bestFit.lineWidth = 2;
    bestFit.lineColor = [UIColor blackColor];
    bestFit.propDefault.symbolStyle = kSymbolNone;

    // Step 3: The uncertainty error band.
    [formFactorChart generateControllerWithData:[[WSDemoData formFactorFit] contourWithError]
                                      plotClass:[WSPlotRegion class]
                                          frame:frame];
    WSPlotRegion *errorBand = (WSPlotRegion *)[formFactorChart lastPlot].view;
    errorBand.fillColor = [UIColor grayColor];
    errorBand.lineColor = [UIColor clearColor];

    // Ensure proper ordering of plots.
    [formFactorChart sendPlotToBack:[formFactorChart lastPlot]];

    // Scale all axis and set the ticks and labels.
    [formFactorChart autoscaleAllAxisX];
    [formFactorChart autoscaleAllAxisY];
    [[formFactorChart firstPlotAxis] autoTicksXD];
    [[formFactorChart firstPlotAxis] setTickLabelsX];
    [[formFactorChart firstPlotAxis] autoTicksYD];
    [[formFactorChart firstPlotAxis] setTickLabelsY];

    return formFactorChart;
}

@end
