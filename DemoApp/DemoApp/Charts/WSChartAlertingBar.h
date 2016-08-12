//
//  WSChartAlertingBar.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 5/7/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartFailedBanksBar.h"

/// This is an extension of the failed banks chart. All bars that exceed
/// a certain threshold are highlighted during a red color. The other bars
/// remain black.
@interface WSChartAlertingBar : WSChartFailedBanksBar

@end
