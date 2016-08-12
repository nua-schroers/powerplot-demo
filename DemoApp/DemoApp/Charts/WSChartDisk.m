//
//  WSChartDisk.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/10/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartDisk.h"
#import "WSDemoData.h"

@implementation WSChartDisk

- (NSString *)title
{
    return NSLocalizedString(@"Solid disk chart", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"A chart solid filled disks", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    WSChart *result = [[WSChart alloc] initWithFrame:frame];

    // Create the coordinate axis manually.
    [result generateControllerWithData:nil
                             plotClass:[WSPlotAxis class]
                                 frame:result.frame];
    WSPlotAxis *axis = (WSPlotAxis *)[result lastPlot].view;

    // Add the disk plot manually.
    [result generateControllerWithData:[WSDemoData scientificData]
                             plotClass:[WSPlotDisc class]
                                 frame:result.frame];
    WSPlotDisc *disk = (WSPlotDisc *)[result lastPlot].view;

    // Configure the standard disk style.
    disk.propDefault.lineWidth = 1.0;
    disk.propDefault.fillColor = [UIColor lightGrayColor];
    disk.propDefault.discStyle = kDiscPlotAll;

    // Finally, configure the axis.
    [result autoscaleAllAxisX];
    [result autoscaleAllAxisY];
    [result setAllAxisLocationXD:0.0];
    [result setAllAxisLocationYD:0.0];
    [axis autoTicksXD];
    [axis autoTicksYD];
    [axis setTickLabelsX];
    [axis setTickLabelsY];

    return result;
}

@end
