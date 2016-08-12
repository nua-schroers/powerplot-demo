//
//  WSChartGroup.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartGroup.h"

@interface WSChartGroup ()

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSArray *charts;

@end

@implementation WSChartGroup

+ (WSChartGroup *)chartGroupWithTitle:(NSString *)theTitle
                               charts:(NSArray *)theCharts
{
    WSChartGroup *result = [[[self class] alloc] init];
    result.title = theTitle;
    result.charts = theCharts;
    return result;
}

@end
