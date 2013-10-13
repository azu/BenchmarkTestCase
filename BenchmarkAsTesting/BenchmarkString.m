//
//  BenchmarkAsTesting.m
//  BenchmarkAsTesting
//
//  Created by azu on 2013/10/13.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BenchmarkTestCase.h"

@interface BenchmarkString : BenchmarkTestCase

@end

@implementation BenchmarkString {
}


- (void)timePatternNSNumber {
    [NSNumber numberWithInteger:1];
}

- (void)timeCompilerPrimitive {
    @1;
}

@end
