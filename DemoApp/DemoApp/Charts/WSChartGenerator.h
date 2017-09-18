//
//  WSChartGenerator.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PowerPlot/PowerPlot.h>

/// This class provides each specific sample chart in the demo app.
@interface WSChartGenerator : NSObject

/// @return The title/name of this chart.
@property (nonatomic, readonly) NSString *title;

/// @return A (brief) description string of this chart.
@property (nonatomic, readonly) NSString *chartDescription;

/// @return The specific view that presents this chart.
///
/// Subclasses should always return a @p WSChart.
- (UIView *)chartWithFrame:(CGRect)frame;

@end
