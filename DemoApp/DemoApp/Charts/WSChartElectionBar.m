//
//  WSChartElectionBar.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartElectionBar.h"
#import "WSDemoData.h"

@implementation WSChartElectionBar

- (NSString *)title
{
    return NSLocalizedString(@"German Federal Election 2009", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A bar chart individually configured bars", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create data set.
    WSData *barData = [[WSDemoData electionResults2009] indexedData];

    // Create and configure a bar plot.
    WSChart *electionChart = [WSChart barPlotWithFrame:frame
                                                  data:barData
                                             barColors:@[[UIColor CSSColorBlack],
                                                         [UIColor CSSColorYellow],
                                                         [UIColor CSSColorRed],
                                                         [UIColor CSSColorGreen],
                                                         [UIColor CSSColorTeal],
                                                         [UIColor CSSColorGray]]
                                                 style:kChartBarPlain
                                                colors:kColorWhite];
    [electionChart scaleAllAxisYD:NARangeMake(-10, 45)];
    [electionChart setAllAxisLocationXD:-0.5];
    [electionChart setAllAxisLocationYD:0];

    // Some customization of the resulting chart.
    WSPlotBar *bar = (WSPlotBar *)electionChart[0].view;
    [bar setValue:[UIColor blackColor]
       forKeyPath:@"dataDelegate.dataD.values.customDatum.outlineColor"];

    WSPlotAxis *axis = [electionChart firstPlotAxis];
    axis.ticksX.ticksStyle = kTicksLabels;
    axis.ticksY.ticksStyle = kTicksLabels;
    [axis.ticksY ticksWithNumbers:@[@0.0f, @10.0f, @20.0f, @30.0f]
                           labels:@[@"", @"10%", @"20%", @"30%"]];
    electionChart.chartTitle = NSLocalizedString(@"Bundestagselection 2009", @"");

    return electionChart;
}

@end
