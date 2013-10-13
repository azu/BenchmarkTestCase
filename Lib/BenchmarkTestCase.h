//
// Created by azu on 2013/10/13.
//


#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface BenchmarkTestCase : XCTestCase
+ (NSString *)benchmarkPrefix;

+ (NSUInteger)benchmarkRepeatCount;

+ (void)benchmarkOutPut:(NSString *) selectorName timeInterval:(NSTimeInterval) timeInterval;

+ (void)addXCTestObserver;

+ (void)removeXCTestObserver;

+ (void)setUpBenchmark;
@end