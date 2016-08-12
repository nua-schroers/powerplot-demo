//
//  WSDetailViewController.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 10/13/13.
//  Copyright (c) 2013 NuAS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSChartGenerator;

@interface WSDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) WSChartGenerator *chart;

@property (weak, nonatomic) IBOutlet UIView *chartView;

@end
