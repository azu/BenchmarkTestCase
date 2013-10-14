//
// Created by azu on 2013/10/14.
//


#import <objc/runtime.h>
#import "AZBenchmarkTestCase.h"
#import "AZBenchmarkTestUtil.h"
#import "AZBenchmarkTestObserver.h"


@implementation AZBenchmarkTestUtil {

}

+ (void)addXCTestObserver {
    NSString *className = NSStringFromClass([AZBenchmarkTestObserver class]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    if (![values containsObject:className]) {
        [values addObject:className];
    }
    [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    [defaults synchronize];
}

+ (void)removeXCTestObserver {
    NSString *className = NSStringFromClass([AZBenchmarkTestObserver class]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    if ([values containsObject:className]) {
        [values removeObject:className];
    }
    if ([values count] == 0) {
        [defaults removeObjectForKey:XCTestObserverClassKey];
    } else {
        [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    }
    [defaults synchronize];
}
@end