//
//  WSChartValueCreationGraph.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartValueCreationGraph.h"
#import "WSDemoData.h"

@implementation WSChartValueCreationGraph

- (NSString *)title
{
    return NSLocalizedString(@"Value Creation Model", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A graph with individually configured nodes", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    // Create the graph model with nodes and connections.
    WSData *graphTest = [WSDemoData valueGraphNodes];
    WSGraphConnections *connections = [WSDemoData valueGraphConnections];
    WSGraph *myGraph = [WSGraph graphWithNodes:graphTest
                                   connections:connections];

    // Create the chart.
    WSChart *gChart = [WSChart graphPlotWithFrame:frame
                                            graph:myGraph
                                           colors:kColorDark];
    WSPlotGraph *graph = (WSPlotGraph *)gChart[0].view;

    // Configure node boxes individually.
    graph.propDefault.shadowEnabled = YES;
    graph.propDefault.outlineStroke = 0;
    graph.style = kCustomStyleIndividual;
    [graph distributeDefaultPropertiesToAllCustomDatum];
    ((WSNodeProperties *)graphTest[0].customDatum).nodeColor = [UIColor darkGrayColor];
    ((WSNodeProperties *)graphTest[3].customDatum).nodeColor = [UIColor darkGrayColor];
    ((WSNodeProperties *)graphTest[5].customDatum).nodeColor = [UIColor redColor];
    ((WSNodeProperties *)graphTest[6].customDatum).nodeColor = [UIColor CSSColorGreen];
    ((WSNodeProperties *)graphTest[6].customDatum).size = CGSizeMake(200, 40);

    return gChart;
}

@end
