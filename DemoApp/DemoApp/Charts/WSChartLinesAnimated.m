//
//  WSChartLinesAnimated.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/10/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartLinesAnimated.h"
#import "WSDemoData.h"

@implementation WSChartLinesAnimated

- (NSString *)title
{
    return NSLocalizedString(@"Animated Line Curve", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A sine function is animated", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Configure the chart with a single line plot.
    WSData *sineFunction = [WSData new];
    const CGFloat resolution = 50;
    [WSDemoData sineFunctionWithData:sineFunction
                                xmin:0.
                                xmax:8.
                              factor:1.
                               phase:0.
                              offset:0.
                          resolution:resolution];
    WSChart *chart = [WSChart linePlotWithFrame:frame
                                           data:sineFunction
                                          style:kChartLineGradient
                                      axisStyle:kCSGrid
                                         colors:kColorDark
                                         labelX:NSLocalizedString(@"x", @"")
                                         labelY:NSLocalizedString(@"o+f*sin(x+p)", @"")];
    chart.chartTitle = NSLocalizedString(@"Sine function", @"");

    // Setup the animation.
    [chart dataAnimateWithDuration:3
                             delay:1
                           options:kWSChartAnimationOptionCurveEaseInOut
                        animations:^{
                            [WSDemoData sineFunctionWithData:sineFunction
                                                        xmin:0.
                                                        xmax:8.
                                                      factor:1.5
                                                       phase:0.5
                                                      offset:1.
                                                  resolution:resolution];
                        }
                           context:NULL
                            update:^(CGFloat progress, id customData) {
                                NSLog(@"This is update: %f!", progress);
                            }
                        completion:^(BOOL completion){
                            NSLog(@"This is completion: %d!", completion);
                        }];

    return chart;
}

@end
