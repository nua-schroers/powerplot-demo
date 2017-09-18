//
//  WSChartElectionBarInteractive.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartElectionBarInteractive.h"

@implementation WSChartElectionBarInteractive

- (NSString *)title
{
    return NSLocalizedString(@"Interactive German Election 2009", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A bar chart that responds to taps on the bars", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create the bar chart just like before.
    WSChart *barChart = (WSChart *)[super chartWithFrame:frame];

    // Add the label.
    [self addLabelToChart:barChart];

    // Add the gesture recognizer.
    WSPlotController *aCtrl = barChart[0];
    aCtrl.tapEnabled = YES;
    aCtrl.delegate = self;
    aCtrl.hitTestMethod = kHitTestX;
    aCtrl.hitResponseMethod = kHitResponseDatum;

    // We are done.
    return barChart;
}

#pragma mark -

/// This method adds a label by modifying the chart passed as an argument.
/// This is not particular to PowerPlot, it merely simplifies the demo app.
- (void)addLabelToChart:(WSChart *)chart
{
    UILabel *selection = [[UILabel alloc] initWithFrame:CGRectMake(chart.bounds.origin.x + chart.bounds.size.width - 175.0,
                                                                   chart.bounds.origin.y + 50.0,
                                                                   150.0, 24.0)];
    selection.font = [UIFont systemFontOfSize:20.0];
    selection.backgroundColor = [UIColor lightGrayColor];
    selection.text = NSLocalizedString(@"-", @"");
    selection.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleBottomMargin);
    self.resultLabel = selection;
    [chart addSubview:selection];
}

#pragma mark - WSControllerGestureDelegate

- (void)controller:(WSPlotController *)controller
  singleTapAtDatum:(NSInteger)i {
    WSDatum *target = controller.dataD[i];
    self.resultLabel.text = [NSString stringWithFormat:@"%@: %2.0f%%",
                             target.annotation,
                             target.value];
}

@end
