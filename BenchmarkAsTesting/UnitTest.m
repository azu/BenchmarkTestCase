//
//  UnitTest.m
//  BenchmarkAsTesting
//
//  Created by azu on 2013/10/14.
//  Copyright (c) 2013 azu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTest : XCTestCase

@end

@implementation UnitTest

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testExample {
    XCTAssertEqual(1, 1);
}

@end
