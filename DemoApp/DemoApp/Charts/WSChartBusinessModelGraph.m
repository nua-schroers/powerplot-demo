//
//  WSChartBusinessModelGraph.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartBusinessModelGraph.h"
#import "WSDemoData.h"

@implementation WSChartBusinessModelGraph

- (NSString *)title
{
    return NSLocalizedString(@"Business Model", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A graph with nodes and connections", @"");
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

    return gChart;
}

@end
