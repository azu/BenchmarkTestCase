//
//  BenchmarkAsTesting.m
//  BenchmarkAsTesting
//
//  Created by azu on 2013/10/13.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BenchmarkTestCase.h"
#import "UniqueArray.h"

@interface BenchmarkAsTesting : BenchmarkTestCase

@end

@implementation BenchmarkAsTesting {
    NSMutableArray *testArray;
}

- (void)setUp {
    [super setUp];
    testArray = [self generateRandomArray];
}

- (NSMutableArray *)generateRandomArray {
    if (testArray == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 10000; i++) {
            int random = arc4random() % 1000000;
            [array addObject:[NSString stringWithFormat:@"%d", random]];
        }
        return array;
    }
    return testArray;
}

- (void)tearDown {
    testArray = nil;
    [super tearDown];
}

+ (NSUInteger)benchmarkRepeatCount {
    return 10000;
}


- (void)benchPatternOne {
    [UniqueArray patternOne:testArray];
}

- (void)benchPatternTwo{
    [UniqueArray patternTwo:testArray];
}

@end
