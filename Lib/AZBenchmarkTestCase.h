//
// Created by azu on 2013/10/13.
//


#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface AZBenchmarkTestCase : XCTestCase
// benchmark method prefix
+ (NSString *)benchmarkPrefix;

// repeat count of benchmark method
+ (NSUInteger)benchmarkRepeatCount;
@end