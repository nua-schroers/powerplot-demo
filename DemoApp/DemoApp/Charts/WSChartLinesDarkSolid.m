//
//  WSChartLinesDarkSolid.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartLinesDarkSolid.h"
#import "WSDemoData.h"

@implementation WSChartLinesDarkSolid

- (NSString *)title
{
    return NSLocalizedString(@"Filled Line Chart", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A line chart with solid fill", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // The chart is done with the automatic factory method using the
    // @p kChartLineFilled style and the @p kColorDarkBlue color scheme.
    return [WSChart linePlotWithFrame:frame
                                 data:[WSDemoData scientificData]
                                style:kChartLineFilled
                            axisStyle:kCSArrows
                               colors:kColorDarkBlue
                               labelX:NSLocalizedString(@"Crystal orientation", @"")
                               labelY:NSLocalizedString(@"Energy output", @"")];
}

@end
