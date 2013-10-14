//
// Created by azu on 2013/10/14.
//


#import "BenchmarkTestObserver.h"
#import "BenchmarkTestUtil.h"
#import "BenchmarkReporter.h"
#import "BenchmarkTestCase.h"


@interface BenchmarkTestObserver ()
@property(nonatomic, strong) NSMutableArray *testRuns;
@end

@implementation BenchmarkTestObserver

- (NSMutableArray *)testRuns {
    if (_testRuns == nil) {
        _testRuns = [NSMutableArray array];
    }
    return _testRuns;
}

- (NSArray *)filteredTestRuns:(NSMutableArray *) array {
    NSMutableArray *benchmarkTestRuns = [NSMutableArray array];
    for (XCTestRun *xcTestRun in array) {
        if ([xcTestRun.test isKindOfClass:[BenchmarkTestCase class]]) {
            [benchmarkTestRuns addObject:xcTestRun];
        }
    }
    return benchmarkTestRuns;
}

- (void)testCaseDidStop:(XCTestRun *) testRun {
    [super testCaseDidStop:testRun];
    [self.testRuns addObject:testRun];
}

- (void)stopObserving {
    [super stopObserving];
    [BenchmarkTestUtil removeXCTestObserver];
    NSArray *filteredTestRuns = [self filteredTestRuns:self.testRuns];
    NSString *string = [BenchmarkReporter outputStringWithXCTestRuns:filteredTestRuns];
    NSLog(@"%@", string);
}


@end