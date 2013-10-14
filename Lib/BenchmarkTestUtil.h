//
// Created by azu on 2013/10/14.
//


#import <Foundation/Foundation.h>

@protocol BenchmarkReporting;


@interface BenchmarkTestUtil : NSObject

+ (void)addXCTestObserver;

+ (void)removeXCTestObserver;
@end