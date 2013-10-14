//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>

@protocol AZBenchmarkReporting;


@interface AZBenchmarkTestUtil : NSObject
+ (void)addXCTestObserver;

+ (void)removeXCTestObserver;
@end