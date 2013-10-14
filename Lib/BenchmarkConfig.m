//
// Created by azu on 2013/10/14.
//


#import "BenchmarkReporter.h"
#import "BenchmarkConfig.h"

static NSObject <BenchmarkReporting> *_reporterReporting;

@implementation BenchmarkConfig {

}
+ (NSObject <BenchmarkReporting> *)defaultReporter {
    if (_reporterReporting == nil) {
        _reporterReporting = [[BenchmarkReporter alloc] init];
    }
    return _reporterReporting;
}

+ (void)setDefaultReporter:(NSObject <BenchmarkReporting> *) reporterClass {
    _reporterReporting = reporterClass;
}
@end