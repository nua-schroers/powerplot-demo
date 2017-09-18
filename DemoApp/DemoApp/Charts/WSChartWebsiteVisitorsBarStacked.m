//
//  WSChartWebsiteVisitorsBarStacked.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/23/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartWebsiteVisitorsBarStacked.h"
#import "WSDemoData.h"

@implementation WSChartWebsiteVisitorsBarStacked

- (NSString *)title
{
    return NSLocalizedString(@"Website Visitors, stacked bars", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A stacked bar chart with the field-theory.org web traffic", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Get the website data.
    WSData *hitsD = [WSDemoData monthlyHits];
    WSData *pageViews = [WSDemoData monthlyPageviews];
    WSData *pageVisitors = [WSDemoData monthlyVisitors];

    // Create and configure the bar chart with multiple data sets as input.
    WSChart *barChart = [WSChart multiBarPlotWithFrame:frame
                                                  data:@[hitsD,
                                                         pageViews,
                                                         pageVisitors]
                                                 style:kChartBarPlain
                                                colors:kColorWhite];

    // Configure the axis.
    [barChart scaleAllAxisYD:NARangeMake(-30000, 1.2*[hitsD maximumValue])];
    [barChart setAllAxisLocationYD:0];
    WSPlotAxis *axis = [barChart firstPlotAxis];
    [[axis ticksY] ticksWithNumbers:@[@20000.0f, @40000.0f, @60000.0f, @80000.0f, @100000.0f]
                             labels:@[@"20k", @"40k", @"60k", @"80k", @"100k"]];

    return barChart;
}

@end
