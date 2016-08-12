//
//  WSChartBusinessModelGraphInteractive.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartBusinessModelGraphInteractive.h"
#import "WSDemoData.h"

@interface WSChartBusinessModelGraphInteractive ()

// Label that displays the currently selected node.
@property (nonatomic, strong) UILabel *selection;

// Callback when a tap is received.
- (void)userDidTap:(UITapGestureRecognizer *)sender;

@end

@implementation WSChartBusinessModelGraphInteractive

- (NSString *)title
{
    return NSLocalizedString(@"Interactive Business Model", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A graph with selectable nodes and connections", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Get the nodes and connections of the graph.
    WSData *graphTest = [WSDemoData demoGraphNodes];
    WSGraphConnections *connections = [WSDemoData demoGraphConnections];
    WSGraph *myGraph = [WSGraph graphWithNodes:graphTest
                                   connections:connections];

    // Create the chart.
    WSChart *gChart = [WSChart graphPlotWithFrame:frame
                                            graph:myGraph
                                           colors:kColorWhite];

    // Manually add a gesture recognizer.
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(userDidTap:)];
    [gChart addGestureRecognizer:tapRecognizer];

    // Finally, add a label that displays the current choice.
    self.selection = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, gChart.frame.size.width, 30)];
    self.selection.backgroundColor = [UIColor clearColor];
    self.selection.text = @"No tap received yet.";

    [gChart addSubview:self.selection];

    return gChart;
}

#pragma mark -

- (void)userDidTap:(UITapGestureRecognizer *)sender
{
    // Identify tap target.
    WSChart *theChart = (WSChart *)sender.view;
    WSPlotGraph *graph = (WSPlotGraph *)theChart[0].view;
    CGPoint tap = [sender locationInView:sender.view];
    NSInteger nodeNum = [graph nodeForPoint:tap];

    if (nodeNum > -1) {
        // User tapped on a node.
        WSDatum *node = [WSDemoData demoGraphNodes][nodeNum];
        self.selection.text = [NSString stringWithFormat:@"Tap on: %@.",
                               node.annotation];
    } else {
        // User tapped elsewhere.
        self.selection.text = @"Tap outside of nodes.";
    }
}

@end
