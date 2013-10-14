//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>

@protocol BenchmarkReporting <NSObject>
- (NSString *)outputStringWithXCTestRuns:(NSArray *) testRuns;
@end