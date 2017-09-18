//
//  WSChartGroup.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WSChartGenerator.h"

/// This is a collection of individual charts belonging to a specific group
/// or category of charts. This might be "all bar charts" or "all graphs"
/// etc. Such a group corresponds to a section in the table view of the demo
/// app.
@interface WSChartGroup : NSObject

/// @return The title/name of this chart group.
@property (nonatomic, readonly) NSString *title;

/// @return The charts contained in this chart group.
///
/// These are objects of class @p WSChartGenerator or a subclass thereof.
@property (nonatomic, readonly) NSArray *charts;

/// @return A new instance of this class.
+ (WSChartGroup *)chartGroupWithTitle:(NSString *)title
                               charts:(NSArray *)charts;

@end
