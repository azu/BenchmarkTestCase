//
// Created by azu on 2013/10/14.
//


#import "BenchmarkTestObserver.h"
#import "BenchmarkTestCase.h"


@implementation BenchmarkTestObserver {

}


- (void)testCaseDidStop:(XCTestRun *) testRun {
    [super testCaseDidStop:testRun];
    NSTimeInterval benchTime = [testRun.stopDate timeIntervalSinceDate:testRun.startDate];
    [BenchmarkTestCase benchmarkOutPut:testRun.test.name timeInterval:benchTime];
}



- (void)stopObserving {
    [super stopObserving];
    [BenchmarkTestCase removeXCTestObserver];
}

@end