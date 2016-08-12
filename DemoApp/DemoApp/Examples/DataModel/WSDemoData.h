//
//  WSDemoData.h
//  PowerPlot
//
//  Created by Wolfram Schroers on 26.10.10.
//  Copyright 2010-2013 Numerik & Analyse Schroers. All rights reserved.
//

@import UIKit;

@class WSData;
@class WSGraphConnections;

/// The sample data points used by the PowerPlot demo app.
@interface WSDemoData : NSObject

/// @return A set of nodes for the demo graph.
+ (WSData *)demoGraphNodes;

/// @return A set of connections for the demo graph.
+ (WSGraphConnections *)demoGraphConnections;

/// @return The German Federal Election 2009 results.
+ (WSData *)electionResults2009;

/// @return A scientific data set with uncertainties.
+ (WSData *)scientificData;

/// @return The numbers of failed banks from 2000 to 2010.
+ (WSData *)failedBanks;

/// @return The set of nodes for the second demo graph - Creating value.
+ (WSData *)valueGraphNodes;

/// @return The set of connections for the second demo graph -- Creating
// value.
+ (WSGraphConnections *)valueGraphConnections;

/// @return The monthly hits on field-theory.org.
+ (WSData *)monthlyHits;

/// @return The monthly pageviews on field-theory.org.
+ (WSData *)monthlyPageviews;

/// @return The monthly unique visitors on field-theory.org.
+ (WSData *)monthlyVisitors;

/// @return A set of scattered points around the center.
+ (WSData *)scatteredPoints;

/// @return A region around the center.
+ (WSData *)centerRegion;

/// @return A wider region around the center.
+ (WSData *)centerRegionWide;

/// @return A measured form factor data set.
+ (WSData *)formFactorMeasured;

/// @return A fit curve with uncertainties to the form factor data set.
+ (WSData *)formFactorFit;

/// @return A set with fictional stock data.
+ (WSData *)stocks1;

/// @return Another set with fictional stock data.
+ (WSData *)stocks2;

/// @return Another set with fictional stock data.
+ (WSData *)stocks3;

/// @return Another set with fictional stock data.
+ (WSData *)stocks4;

/// @return A set of annotated data representing a cost/benefit analysis
/// of mobile platforms.
+ (WSData *)annotatedData;

/// @brief Modify data to a sine function.
///
/// The input data set is modified to contain a sine function with
/// phase and overall multiplicative factor.
+ (void)sineFunctionWithData:(WSData *)data
                        xmin:(CGFloat)xmin
                        xmax:(CGFloat)xmax
                      factor:(CGFloat)factor
                       phase:(CGFloat)phase
                      offset:(CGFloat)offset
                  resolution:(CGFloat)resolution;

/// Total cost and net profit for a software project in two scenarios.
///
/// One scenario is a "bad" scenario with high cost and low
/// profits. The other is a "good" scenario with low cost and high
/// profits.
+ (WSData *)projectCostBad;
+ (WSData *)totalProfitBad;

+ (WSData *)projectCostGood;
+ (WSData *)totalProfitGood;

@end
