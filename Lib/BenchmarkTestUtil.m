//
// Created by azu on 2013/10/14.
//


#import <objc/runtime.h>
#import "BenchmarkTestCase.h"
#import "BenchmarkTestUtil.h"


@implementation BenchmarkTestUtil {

}

+ (void)addXCTestObserver {
    NSString *className = NSStringFromClass([BenchmarkTestCase class]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    [values addObject:className];
    [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    [defaults synchronize];
}

+ (void)removeXCTestObserver {
    NSString *className = NSStringFromClass([BenchmarkTestCase class]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *observers = [defaults objectForKey:XCTestObserverClassKey];
    NSMutableArray *values = [[observers componentsSeparatedByString:@","] mutableCopy];
    [values removeObject:className];
    if ([values count] == 0) {
        [defaults removeObjectForKey:XCTestObserverClassKey];
    } else {
        [defaults setObject:[values componentsJoinedByString:@","] forKey:XCTestObserverClassKey];
    }
    [defaults synchronize];
}
@end