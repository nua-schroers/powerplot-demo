//
//  WSChartFailedBanksBar.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartFailedBanksBar.h"
#import "WSDemoData.h"

@implementation WSChartFailedBanksBar

- (NSString *)title
{
    return NSLocalizedString(@"Failed Banks", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A bar chart with the number of failed banks", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create and configure a bar chart.
    WSChart *barChart = [WSChart barPlotWithFrame:frame
                                             data:[WSDemoData failedBanks]
                                            style:kChartBarPlain
                                           colors:kColorWhite];
    WSPlotAxis *axis = [barChart firstPlotAxis];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.groupingSeparator = @"";
    [axis.ticksX setTickLabelsWithFormatter:formatter];
    barChart.chartTitle = NSLocalizedString(@"Failed banks by year", @"");

    return barChart;
}

@end
