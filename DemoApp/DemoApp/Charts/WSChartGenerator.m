//
//  WSChartGenerator.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/8/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartGenerator.h"

@implementation WSChartGenerator

- (UIView *)chartWithFrame:(CGRect)frame
{
    UILabel *explanationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    explanationLabel.text = NSLocalizedString(@"Please select a chart from the list", @"");
    explanationLabel.textAlignment = NSTextAlignmentCenter;
    explanationLabel.numberOfLines = 0;
    explanationLabel.center = CGPointMake(frame.origin.x + frame.size.width/2,
                                          frame.origin.y + frame.size.height/2);
    return explanationLabel;
}

@end
