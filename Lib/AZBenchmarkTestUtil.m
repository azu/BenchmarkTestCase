//
// Created by azu on 2013/10/14.
//


#import "AZBenchmarkTestCase.h"
#import "AZBenchmarkTestUtil.h"


@implementation AZBenchmarkTestUtil {

}


NSString *const observerClassName = @"AZBenchmarkTestObserver";

+ (void)addXCTestObserver {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    if (![values containsObject:observerClassName]) {
        [values addObject:observerClassName];
    }
    [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    [defaults synchronize];
}

+ (void)removeXCTestObserver {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    if ([values containsObject:observerClassName]) {
        [values removeObject:observerClassName];
    }
    if ([values count] == 0) {
        [defaults removeObjectForKey:XCTestObserverClassKey];
    } else {
        [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    }
    [defaults synchronize];
}
@end