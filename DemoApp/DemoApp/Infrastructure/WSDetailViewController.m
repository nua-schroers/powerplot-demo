//
//  WSDetailViewController.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 10/13/13.
//  Copyright (c) 2013 NuAS. All rights reserved.
//

#import "WSDetailViewController.h"
#import "WSChartGenerator.h"

@interface WSDetailViewController ()

@property (strong, nonatomic) UIPopoverController *masterPopoverController;

- (void)configureView;

@end

@implementation WSDetailViewController

#pragma mark - Managing the detail item

- (void)setChart:(WSChartGenerator *)chart
{
    if (_chart != chart) {
        _chart = chart;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.
    for (UIView *aView in self.chartView.subviews) {
        [aView removeFromSuperview];
    }
    CGRect frame = self.chartView ? self.chartView.frame : CGRectMake(0, 0, 10, 10);
    WSChart *theChart = (WSChart *)[self.chart chartWithFrame:frame];
    [self.chartView addSubview:theChart];
    [self viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!self.chart) {
        self.chart = [WSChartGenerator new];
    }
    [self configureView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([[self.chartView.subviews firstObject] respondsToSelector:@selector(abortAnimation)]) {
        [[self.chartView.subviews firstObject] abortAnimation];
    }
}

- (void)viewDidLayoutSubviews
{
    for (UIView *aView in self.chartView.subviews) {
        aView.frame = CGRectMake(0, 0, self.chartView.frame.size.width, self.chartView.frame.size.height);
    }
    [super viewDidLayoutSubviews];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController
     willHideViewController:(UIViewController *)viewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Full List", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
