//
// Created by azu on 2013/10/14.
//


#import <XCTest/XCTest.h>
#import "BenchmarkReporter.h"
#import "BenchmarkTestCase.h"


@implementation BenchmarkReporter {

}


- (NSString *)outputStringWithXCTestRuns:(NSArray *) testRuns {
    NSString *header = [NSString stringWithFormat:@"\n%-50s %-10s %-10s",
                                                  [@":Name" UTF8String], [@":Total(s)" UTF8String], [@":Avg(s)" UTF8String]];
    NSMutableArray *lineArray = [NSMutableArray arrayWithObject:header];
    NSString *lineFormat = @"%-50s %-10.5f %-10.5f %@";
    for (XCTestRun *xcTestRun in testRuns) {
        NSUInteger repeatCount = [[xcTestRun.test class] benchmarkRepeatCount];
        NSTimeInterval totalTimeInterval = [xcTestRun.stopDate timeIntervalSinceDate:xcTestRun.startDate];
        NSString *lineLog = [NSString stringWithFormat:lineFormat,
                                                       [xcTestRun.test.name UTF8String],
                                                       totalTimeInterval,
                                                       totalTimeInterval / repeatCount,
                                                       [NSString stringWithFormat:@"(1/%d)", repeatCount]];

        [lineArray addObject:lineLog];
    }
    return [lineArray componentsJoinedByString:@"\n"];
}


@end