//
//  WSChartAdministriva.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 3/10/14.
//  Copyright (c) 2014 NuAS. All rights reserved.
//

#import "WSChartAdministriva.h"

@implementation WSChartAdministriva

- (NSString *)title
{
    return NSLocalizedString(@"Version and License", @"");
}

- (NSString *)chartDescription
{
    return NSLocalizedString(@"Displays version and license information", @"");
}

- (UIView *)chartWithFrame:(CGRect)frame
{
    UIView *container = [[UIView alloc] initWithFrame:frame];

    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    versionLabel.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
                                     UIViewAutoresizingFlexibleRightMargin |
                                     UIViewAutoresizingFlexibleTopMargin |
                                     UIViewAutoresizingFlexibleBottomMargin);
    versionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"PowerPlot: %@, Demo app: %@", @""),
                         [WSChart version],
                         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.numberOfLines = 0;
    versionLabel.center = CGPointMake(frame.origin.x + frame.size.width/2,
                                      frame.origin.y + frame.size.height/2);
    [container addSubview:versionLabel];

    UILabel *licenseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    licenseLabel.autoresizingMask = versionLabel.autoresizingMask;
    licenseLabel.text = [NSString stringWithFormat:NSLocalizedString(@"License: %@", @""),
                         [WSChart license]];
    licenseLabel.textAlignment = NSTextAlignmentCenter;
    licenseLabel.numberOfLines = 0;
    licenseLabel.center = CGPointMake(versionLabel.center.x,
                                      versionLabel.center.y + licenseLabel.frame.size.height + 20.0);
    [container addSubview:licenseLabel];

    return container;
}

@end
