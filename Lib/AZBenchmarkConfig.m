//
// Created by azu on 2013/10/14.
//


#import "AZBenchmarkReporter.h"
#import "AZBenchmarkConfig.h"

static NSObject <AZBenchmarkReporting> *_reporterReporting;

@implementation AZBenchmarkConfig {

}

+ (NSObject <AZBenchmarkReporting> *)defaultReporter {
    if (_reporterReporting == nil) {
        _reporterReporting = [[AZBenchmarkReporter alloc] init];
    }
    return _reporterReporting;
}

+ (void)setDefaultReporter:(NSObject <AZBenchmarkReporting> *) reporterClass {
    _reporterReporting = reporterClass;
}
@end