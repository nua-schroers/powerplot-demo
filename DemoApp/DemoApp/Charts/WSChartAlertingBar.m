//
//  WSChartAlertingBar.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/7/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartAlertingBar.h"

@implementation WSChartAlertingBar

- (NSString *)title
{
    return NSLocalizedString(@"Failed Banks with alerting", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A bar chart high bars displayed in a different color", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create and configure a bar chart.
    WSChart *barChart = (WSChart *)[super chartWithFrame:frame];

    // Configure alerting function.
    WSPlotBar *barPlot = ((WSPlotBar *)[barChart firstPlotOfClass:[WSPlotBar class]]);
    WSPlotController *barCtrl = barPlot.plotController;
    barPlot.style = kCustomStyleIndividual;
    ((WSBarProperties *)barPlot.plotController.standardProperties).barColor = [UIColor blackColor];
    ((WSBarProperties *)barPlot.plotController.standardProperties).outlineColor = [UIColor blackColor];
    barCtrl.alertBlock = (alertBlock_t)^(WSDatum *datum){
        return (datum.valueY > 10);
    };
    [barCtrl updateAlertedData];

    return barChart;
}

@end
