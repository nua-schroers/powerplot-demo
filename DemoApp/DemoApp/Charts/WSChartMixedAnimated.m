//
//  WSChartMixedAnimated.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartMixedAnimated.h"
#import "WSDemoData.h"

/// Duration of the animation (in seconds).
const static NAFloat duration = 2;

@implementation WSChartMixedAnimated

- (NSString *)title
{
    return NSLocalizedString(@"Animated Bar/Line Chart", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A chart with bars and lines is simultaneously animated", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // We need two data sets: project cost (displayed in using the bars) and
    // net profits (displayed using the lines).
    self.projectCost = [WSDemoData projectCostBad];
    self.totalProfit = [WSDemoData totalProfitBad];

    // Create and configure the bar chart with the project cost.
    self.chart = [WSChart barPlotWithFrame:frame
                                      data:self.projectCost
                                     style:kChartBarPlain
                                    colors:kColorLight];

    // Manually set the axis, make them static. This way they cover the
    // required ranges for both scenarios.
    WSPlotAxis *axis = [self.chart firstPlotAxis];
    [self.chart scaleAllAxisYD:NARangeMake(-50, 200)];
    [self.chart setAllAxisLocationYD:0.];
    [axis setTicksXDWithData:self.projectCost];
    [axis autoTicksYD];
    [axis.ticksX setTickLabelsWithStyle:NSNumberFormatterNoStyle];
    [axis.ticksY setTickLabelsWithStyle:NSNumberFormatterNoStyle];

    // Configure the appearance of the bars.
    WSPlotBar *barPlot = [self.chart firstPlotOfClass:[WSPlotBar class]];
    WSBarProperties *barDefault = (WSBarProperties *)barPlot.propDefault;
    barDefault.outlineColor = [UIColor darkGrayColor];
    barDefault.barColor = [UIColor darkGrayColor];
    barDefault.barColor2 = [UIColor redColor];
    barDefault.style = kBarGradient;

    // Add the line curve with the net profits.
    [self.chart generateControllerWithData:self.totalProfit
                                 plotClass:[WSPlotData class]
                                     frame:self.chart.frame];
    WSPlotData *linePlot = [self.chart firstPlotOfClass:[WSPlotData class]];
    linePlot.propDefault.symbolStyle = kSymbolNone;
    linePlot.lineWidth = 3;

    // Add the segmented control.
    [self addSegmentedControlToChartWithFrame:frame];

    // We are done.
    return self.chart;
}

#pragma mark -

/// This method adds the segmented control and configures it fire the
/// @p toggleSwitch: selector.
- (void)addSegmentedControlToChartWithFrame:(CGRect)frame
{
    // Create the segmented control.
    self.selector = [[UISegmentedControl alloc] initWithItems:@[NSLocalizedString(@"Bad", @""),
                                                                NSLocalizedString(@"Good", @"")]];
    [self.selector setSelectedSegmentIndex:0];

    // Configure the positioning.
    self.selector.center = CGPointMake(frame.origin.x + frame.size.width/2.f,
                                       frame.origin.y + 0.1f);
    self.selector.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                      UIViewAutoresizingFlexibleRightMargin |
                                      UIViewAutoresizingFlexibleBottomMargin);

    // Set the action.
    [self.selector addTarget:self
                      action:@selector(toggleSwitch:)
            forControlEvents:UIControlEventValueChanged];

    // Finally, add the selector.
    [self.chart addSubview:self.selector];
}

// Respond to segmented control changes.
- (void)toggleSwitch:(UISegmentedControl *)sender
{
    switch ([sender selectedSegmentIndex]) {
        case 0:
            // Bad scenario.
            [self badScenario];
            break;

        case 1:
            // Good scenario.
            [self goodScenario];
            break;
    }
}

// Animate to the "good" scenario.
- (void)goodScenario
{
    if (self.chart.animationTimer != nil) {
        [self.chart abortAnimation];
    }

    [self.chart dataAnimateWithDuration:duration
                             animations:^{
                                 self.chart[0].dataD = [WSDemoData projectCostGood];
                                 self.chart[2].dataD = [WSDemoData totalProfitGood];
                             }];
}

// Animate to the "bad" scenario.
- (void)badScenario
{
    if (self.chart.animationTimer != nil) {
        [self.chart abortAnimation];
    }

    [self.chart dataAnimateWithDuration:duration
                             animations:^{
                                 self.chart[0].dataD = [WSDemoData projectCostBad];
                                 self.chart[2].dataD = [WSDemoData totalProfitBad];
                             }];
}

@end
