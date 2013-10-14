//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>


@interface BenchmarkConfig : NSObject
+ (NSObject <BenchmarkReporting> *)defaultReporter;

+ (void)setDefaultReporter:(NSObject <BenchmarkReporting>*)reporter;
@end