//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>

@protocol AZBenchmarkReporting <NSObject>
- (NSString *)outputStringWithXCTestRuns:(NSArray *) testRuns;
@end