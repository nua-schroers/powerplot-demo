//
//  WSChartElectionBarInteractive.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/9/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartElectionBar.h"

/// This chart extends the @p WSChartElectionBar example by the ability to
/// receive and respond to single tap events.
@interface WSChartElectionBarInteractive : WSChartElectionBar <WSControllerGestureDelegate>

@property (nonatomic, strong) IBOutlet UILabel *resultLabel;

@end
