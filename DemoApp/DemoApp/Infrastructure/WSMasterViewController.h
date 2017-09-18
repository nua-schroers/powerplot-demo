//
//  WSMasterViewController.h
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 10/13/13.
//  Copyright (c) 2013 NuAS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSDetailViewController;

@interface WSMasterViewController : UITableViewController

@property (strong, nonatomic) WSDetailViewController *detailViewController;

@end
