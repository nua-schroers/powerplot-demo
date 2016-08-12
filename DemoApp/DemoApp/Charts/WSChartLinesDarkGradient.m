//
//  WSChartLinesDarkGradient.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartLinesDarkGradient.h"
#import "WSDemoData.h"

@implementation WSChartLinesDarkGradient

- (NSString *)title
{
    return NSLocalizedString(@"Gradient Line Chart", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A line chart with gradient fill", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // The chart is done with the automatic factory method using the
    // @p kChartLineGradient style and the @p kColorDark color scheme.
    return [WSChart linePlotWithFrame:frame
                                 data:[WSDemoData scientificData]
                                style:kChartLineGradient
                            axisStyle:kCSGrid
                               colors:kColorDark
                               labelX:NSLocalizedString(@"Crystal orientation", @"")
                               labelY:NSLocalizedString(@"Energy output", @"")];
}

@end
