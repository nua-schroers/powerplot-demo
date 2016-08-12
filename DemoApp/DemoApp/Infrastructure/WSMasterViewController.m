//
//  WSMasterViewController.m
//  PowerPlot
//
//  Created by Dr. Wolfram Schroers on 10/13/13.
//  Copyright (c) 2013 NuAS. All rights reserved.
//

#import "WSMasterViewController.h"
#import "WSDetailViewController.h"
#import "WSChartList.h"

@interface WSMasterViewController ()

@property (nonatomic, strong) NSArray *chartGroups;

@end

@implementation WSMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (WSDetailViewController *)[self.splitViewController.viewControllers[1]
                                                           topViewController];
    self.chartGroups = allChartGroups();
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.chartGroups count];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [((WSChartGroup *)self.chartGroups[section]).charts count];
}

- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return ((WSChartGroup *)self.chartGroups[section]).title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"
                                                            forIndexPath:indexPath];

    WSChartGenerator *theChart = ((WSChartGroup *)self.chartGroups[indexPath.section]).charts[indexPath.row];
    cell.textLabel.text = theChart.title;
    cell.detailTextLabel.text = theChart.chartDescription;
    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        WSChartGenerator *theChart = ((WSChartGroup *)self.chartGroups[indexPath.section]).charts[indexPath.row];
        self.detailViewController.chart = theChart;
        self.detailViewController.title = theChart.title;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WSChartGenerator *theChart = ((WSChartGroup *)self.chartGroups[indexPath.section]).charts[indexPath.row];
        [[segue destinationViewController] setChart:theChart];
        [[segue destinationViewController] setTitle:theChart.title];
    }
}

@end
