//
//  WSChartAnimatedLines.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/7/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartAnimatedLines.h"

@implementation WSChartAnimatedLines

- (NSString *)title
{
    return NSLocalizedString(@"Animated Scientific Fit", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A sequence of animations with the scientific lines fit", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Replicate the starting chart from the @p WSChartScientificFitLines example.
    self.formFactorChart = (WSChart *)[super chartWithFrame:frame];

    // Once the chart is set up, start the animation.
    [self.formFactorChart setAllAxisPreserveOnChangeX:kPreserveRelative];
    [self.formFactorChart setAllAxisPreserveOnChangeY:kPreserveRelative];
    [self zoomToRegion1];

    return self.formFactorChart;
}

#pragma mark - Perform a zoom to different parts of the chart, cycle zoom.

- (void)zoomToRegion1
{
    [self.formFactorChart dataAnimateWithDuration:2.
                                       animations:^{
                                           WSCoordinate *cX = self.formFactorChart[0].coordX;
                                           WSCoordinate *cY = self.formFactorChart[0].coordY;
                                           cX.coordRangeD = NARangeMake(0.1, 0.3);
                                           cY.coordRangeD = NARangeMake(0.7, 0.8);
                                       }
                                       completion:^(BOOL completed) {
                                           if (completed) {
                                               [self zoomToRegion2];
                                           }
                                       }];
}

- (void)zoomToRegion2
{
    [self.formFactorChart dataAnimateWithDuration:2.
                                       animations:^{
                                           WSCoordinate *cX = self.formFactorChart[0].coordX;
                                           WSCoordinate *cY = self.formFactorChart[0].coordY;
                                           cX.coordRangeD = NARangeMake(0.9, 1.1);
                                           cY.coordRangeD = NARangeMake(0.4, 0.6);
                                       }
                                       completion:^(BOOL completed) {
                                           if (completed) {
                                               [self zoomToRegion3];
                                           }
                                       }];
}

- (void)zoomToRegion3
{
    [self.formFactorChart dataAnimateWithDuration:2.
                                       animations:^{
                                           [self.formFactorChart autoscaleAllAxisX];
                                           [self.formFactorChart autoscaleAllAxisY];
                                       }
                                       completion:^(BOOL completed) {
                                           if (completed) {
                                               [self zoomToRegion1];
                                           }
                                       }];
}

@end
