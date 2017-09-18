//
//  WSChartScientificFitLinesInteractive.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartScientificFitLinesInteractive.h"
#import "WSDemoData.h"

@implementation WSChartScientificFitLinesInteractive

- (NSString *)title
{
    return NSLocalizedString(@"Interactive Scientific Fit", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A line chart that can be zoomed and panned", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create the bar chart just like before.
    WSChart *formFactorChart = (WSChart *)[super chartWithFrame:frame];

    // Now configure the zooming and scrolling behavior.
    [formFactorChart setAllAxisPreserveOnChangeX:kPreserveRelative];
    [formFactorChart setAllAxisPreserveOnChangeY:kPreserveRelative];
    WSPlotController *aCtrl = [formFactorChart lastPlot];
    [aCtrl setMaximumZoomScaleXD:2.
              maximumZoomScaleYD:2.
              minimumZoomScaleXD:0.75
              minimumZoomScaleYD:0.75];
    NAFloat scaleX = NARangeLen(aCtrl.zoomRangeXD);
    NAFloat scaleY = NARangeLen(aCtrl.zoomRangeYD);
    aCtrl.zoomRangeXD = NARangeMake(scaleX/3, scaleX*1.25);
    aCtrl.zoomRangeYD = NARangeMake(scaleY/3, scaleY*1.25);
    aCtrl.zoomEnabled = YES;
    aCtrl.scrollEnabled = YES;

    // Configure the single tap feature.
    aCtrl.tapEnabled = YES;
    aCtrl.delegate = self;
    aCtrl.hitTestMethod = (kHitTestX | kHitTestY);
    aCtrl.hitResponseMethod = kHitResponseDatum;

    return formFactorChart;
}

#pragma mark - WSControllerGestureDelegate

- (void)controller:(WSPlotController *)controller
  singleTapAtDatum:(NSInteger)i {
    NSLog(@"Datum hit: %ld.", (long)i);
}

@end
