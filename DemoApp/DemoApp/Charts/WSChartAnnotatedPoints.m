//
//  WSChartAnnotatedPoints.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 4/6/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartAnnotatedPoints.h"
#import "WSDemoData.h"

@implementation WSChartAnnotatedPoints
{
    WSData *_costBenefitAnalysis;
}

- (NSString *)title
{
    return NSLocalizedString(@"Annotated Data Points", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"Cost/benefit analysis", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // The annotated data set.
    _costBenefitAnalysis = [WSDemoData annotatedData];

    // First create a regular line plot (with no line).
    WSChart *chart = [WSChart linePlotWithFrame:frame
                                           data:_costBenefitAnalysis
                                          style:kChartLineEmpty
                                      axisStyle:kCSArrows
                                         colors:kColorWhite
                                         labelX:NSLocalizedString(@"Development Cost", @"")
                                         labelY:NSLocalizedString(@"Profitability", @"")];
    WSPlotData *pointsPlot = (WSPlotData *)[chart firstPlotOfClass:[WSPlotData class]];
    pointsPlot.propDefault.symbolStyle = kSymbolStar;
    [chart setAllAxisLocationToOriginXD];
    [chart setAllAxisLocationToOriginYD];
    [chart firstPlotAxis].ticksX = nil;
    [chart firstPlotAxis].ticksY = nil;

    // Next add the annotations chart.
    [chart generateControllerWithData:_costBenefitAnalysis
                            plotClass:[WSPlotCustomView class]
                                frame:frame];
    WSPlotCustomView *customPlot = [chart firstPlotOfClass:[WSPlotCustomView class]];
    customPlot.dataSource = self;
    customPlot.customPositioning = kCustomPositioningLeftXTopY;
    customPlot.offsetX = -20.f;
    customPlot.offsetY = 7.f;

    return chart;
}

- (UIView *)plotCustomView:(WSPlotCustomView *)customView
       viewForDatumAtIndex:(NSUInteger)index
{
    UILabel *theLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    theLabel.text = _costBenefitAnalysis.annotationsFromData[index];
    [theLabel sizeToFit];
    return theLabel;
}

@end

