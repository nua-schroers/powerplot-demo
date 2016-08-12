//
//  WSChartMultiLines.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartMultiLines.h"
#import "WSDemoData.h"

@implementation WSChartMultiLines

- (NSString *)title
{
    return NSLocalizedString(@"Multiple Lines", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A chart with several line plots", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    WSChart *result = [[WSChart alloc] initWithFrame:frame];

    // Create a few line plots with their controllers.
    [result generateControllerWithData:nil
                             plotClass:[WSPlotAxis class]
                                 frame:result.frame];
    WSPlotAxis *axis = (WSPlotAxis *)[result lastPlot].view;
    [result generateControllerWithData:[WSDemoData stocks1]
                             plotClass:[WSPlotData class]
                                 frame:result.frame];
    WSPlotData *line1 = (WSPlotData *)[result lastPlot].view;
    [result generateControllerWithData:[WSDemoData stocks2]
                             plotClass:[WSPlotData class]
                                 frame:result.frame];
    WSPlotData *line2 = (WSPlotData *)[result lastPlot].view;
    [result generateControllerWithData:[WSDemoData stocks3]
                             plotClass:[WSPlotData class]
                                 frame:result.frame];
    WSPlotData *line3 = (WSPlotData *)[result lastPlot].view;
    [result generateControllerWithData:[WSDemoData stocks4]
                             plotClass:[WSPlotData class]
                                 frame:result.frame];
    WSPlotData *line4 = (WSPlotData *)[result lastPlot].view;

    // Configure the appearance of the coordinate axis.
    axis.axisX.axisStyle = kAxisPlain;
    axis.axisY.axisStyle = kAxisNone;
    axis.axisY.gridStyle = kGridDotted;
    [axis.ticksX setTickLabelsWithStrings:@[@"J", @"F", @"M", @"A", @"M", @"J", @"J", @"A", @"S", @"O", @"N", @"D"]];
    axis.ticksX.ticksStyle = kTicksLabels;
    axis.axisStrokeWidth = 2.0;
    [axis.ticksY autoTicksWithRange:NARangeMake(0.0, 180.0) number:6 skipFirst:YES];
    axis.ticksY.ticksDir = kTDirectionNone;
    axis.gridStrokeWidth = 1.0;

    // Configure the appearance of the lines in the individual line plots.
    line1.lineColor = [UIColor redColor];
    line2.lineColor = [UIColor blueColor];
    line3.lineColor = [UIColor greenColor];
    line4.lineColor = [UIColor blackColor];
    line1.propDefault.symbolStyle = kSymbolEmptySquare;
    line2.propDefault.symbolStyle = kSymbolTriangleUp;
    line3.propDefault.symbolStyle = kSymbolDisk;
    line4.propDefault.symbolStyle = kSymbolSquare;
    line1.propDefault.symbolColor = line1.lineColor;
    line2.propDefault.symbolColor = line2.lineColor;
    line3.propDefault.symbolColor = line3.lineColor;
    line4.propDefault.symbolColor = line4.lineColor;
    line3.propDefault.symbolSize = 8.0;
    line2.shadowEnabled = YES;
    line3.shadowEnabled = YES;
    line4.shadowEnabled = YES;
    line2.shadowScale = 2.0;
    line4.shadowScale = 10.0;
    line1.intStyle = kInterpolationSpline;
    line2.intStyle = kInterpolationSpline;
    line3.intStyle = kInterpolationSpline;

    // Finally, configure the axis and chart title.
    [result autoscaleAllAxisX];
    [result autoscaleAllAxisY];
    [result setAllAxisLocationXD:0.0];
    [result setAllAxisLocationYD:0.0];
    result.chartTitle = self.title;

    return result;
}

@end
