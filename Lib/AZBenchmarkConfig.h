//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>
#import "AZBenchmarkReporter.h"
@interface AZBenchmarkConfig : NSObject
+ (NSObject <AZBenchmarkReporting> *)defaultReporter;

+ (void)setDefaultReporter:(NSObject <AZBenchmarkReporting>*)reporter;
@end