//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>


@interface BenchmarkReporter : NSObject
+ (NSString *)outputStringWithXCTestRuns:(NSArray *) testRuns;
@end