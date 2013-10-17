//
// Created by azu on 2013/10/14.
//


#import "AZBenchmarkTestObserver.h"
#import "AZBenchmarkReporter.h"
#import "AZBenchmarkTestCase.h"
#import "AZBenchmarkConfig.h"
#import "AZBenchmarkTestUtil.h"


@interface AZBenchmarkTestObserver ()
@property(nonatomic, strong) NSMutableArray *testRuns;
@end

@implementation AZBenchmarkTestObserver

- (NSMutableArray *)testRuns {
    if (_testRuns == nil) {
        _testRuns = [NSMutableArray array];
    }
    return _testRuns;
}

- (NSArray *)filteredTestRuns:(NSMutableArray *) array {
    NSMutableArray *benchmarkTestRuns = [NSMutableArray array];
    for (XCTestRun *xcTestRun in array) {
        if ([xcTestRun.test isKindOfClass:[AZBenchmarkTestCase class]]) {
            [benchmarkTestRuns addObject:xcTestRun];
        }
    }
    return benchmarkTestRuns;
}

- (void)testCaseDidStop:(XCTestRun *) testRun {
    [super testCaseDidStop:testRun];
    [self.testRuns addObject:testRun];
}

- (void)startObserving {
    [super startObserving];
}

- (void)stopObserving {
    [super stopObserving];
    [AZBenchmarkTestUtil removeXCTestObserver];
    NSArray *filteredTestRuns = [self filteredTestRuns:self.testRuns];
    NSObject <AZBenchmarkReporting> *reporter = [AZBenchmarkConfig defaultReporter];
    NSLog(@"%@", [reporter outputStringWithXCTestRuns:filteredTestRuns]);
}


@end