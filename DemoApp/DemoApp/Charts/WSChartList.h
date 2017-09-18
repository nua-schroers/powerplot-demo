//
//  WSChartList.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#ifndef PowerPlot_WSChartList_h
#define PowerPlot_WSChartList_h

#import "WSChartGroup.h"
#import "WSChartGenerator.h"
#import "WSChartAdministriva.h"
#import "WSChartLinesAnimated.h"
#import "WSChartBusinessModelGraph.h"
#import "WSChartBusinessModelGraphInteractive.h"
#import "WSChartValueCreationGraph.h"
#import "WSChartFailedBanksBar.h"
#import "WSChartAlertingBar.h"
#import "WSChartWebsiteVisitorsBar.h"
#import "WSChartWebsiteVisitorsBarStacked.h"
#import "WSChartWebsiteVisitorsBarTouching.h"
#import "WSChartElectionBar.h"
#import "WSChartElectionBarInteractive.h"
#import "WSChartScientificLines.h"
#import "WSChartAnimatedLines.h"
#import "WSChartLinesDarkGradient.h"
#import "WSChartLinesDarkSolid.h"
#import "WSChartContourRegion.h"
#import "WSChartMultiLines.h"
#import "WSChartScientificFitLines.h"
#import "WSChartScientificFitLinesInteractive.h"
#import "WSChartMixedAnimated.h"
#import "WSChartAnnotatedPoints.h"
#import "WSChartDisk.h"

/// @return The chart group for general/administrative stuff.
WSChartGroup *allGeneralGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"General", @"")
                                      charts:@[[WSChartAdministriva new]]];
}

/// @return The chart group for all animations.
WSChartGroup *allAnimationsGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Animations", @"")
                                      charts:@[[WSChartLinesAnimated new],
                                               [WSChartAnimatedLines new],
                                               [WSChartMixedAnimated new]]];
}

/// @return The chart group for all interactive charts.
WSChartGroup *allInteractivesGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Interactive Charts", @"")
                                      charts:@[[WSChartBusinessModelGraphInteractive new],
                                               [WSChartElectionBarInteractive new],
                                               [WSChartScientificFitLinesInteractive new]]];
}

/// @return The chart group for all graphs.
WSChartGroup *allGraphsGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Graphs", @"")
                                      charts:@[[WSChartBusinessModelGraph new],
                                               [WSChartBusinessModelGraphInteractive new],
                                               [WSChartValueCreationGraph new]]];
}

/// @return The chart group for all bar charts.
WSChartGroup *allBarChartsGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Bar Charts", @"")
                                      charts:@[[WSChartFailedBanksBar new],
                                               [WSChartWebsiteVisitorsBar new],
                                               [WSChartWebsiteVisitorsBarStacked new],
                                               [WSChartWebsiteVisitorsBarTouching new],
                                               [WSChartElectionBar new],
                                               [WSChartElectionBarInteractive new],
                                               [WSChartAlertingBar new],
                                               [WSChartMixedAnimated new]]];
}

/// @return The chart group for all line charts.
WSChartGroup *allLineChartsGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Line Charts", @"")
                                      charts:@[[WSChartScientificLines new],
                                               [WSChartLinesDarkGradient new],
                                               [WSChartLinesDarkSolid new],
                                               [WSChartContourRegion new],
                                               [WSChartMultiLines new],
                                               [WSChartScientificFitLines new],
                                               [WSChartScientificFitLinesInteractive new],
                                               [WSChartLinesAnimated new],
                                               [WSChartAnnotatedPoints new],
                                               [WSChartAnimatedLines new],
                                               [WSChartMixedAnimated new]]];
}

/// @return The chart group for all disk charts.
WSChartGroup *allDiskChartsGroup()
{
    return [WSChartGroup chartGroupWithTitle:NSLocalizedString(@"Disk Charts", @"")
                                      charts:@[[WSChartDisk new]]];
}

/// @return The full collection of all chart groups in the demo app.
NSArray *allChartGroups()
{
    return @[allGeneralGroup(),
             allAnimationsGroup(),
             allInteractivesGroup(),
             allGraphsGroup(),
             allBarChartsGroup(),
             allLineChartsGroup(),
             allDiskChartsGroup()];
}

#endif /* defined PowerPlot_WSChartList_h */
