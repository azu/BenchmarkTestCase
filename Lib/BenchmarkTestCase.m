//
// Created by azu on 2013/10/13.
//


#import "BenchmarkTestCase.h"
#import "BenchmarkTestUtil.h"
#import <objc/runtime.h>

@implementation BenchmarkTestCase {

}

#pragma mark - Singleton methods

static BenchmarkTestCase *_sharedManager = nil;

static dispatch_once_t onceToken;

+ (instancetype)sharedManager {
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

- (void)dealloc {
    onceToken = 0;
    _sharedManager = nil;
}

#pragma mark - Configuration
+ (NSString *)benchmarkPrefix {
    return @"time";
}

+ (NSUInteger)benchmarkRepeatCount {
    return 10;
}

+ (void)benchmarkOutPut:(NSString *) selectorName timeInterval:(NSTimeInterval) timeInterval {
    NSLog(@"%@ \n└ Total :%.5fs | Avg.: %.5fs", selectorName,
        timeInterval,
        timeInterval / [[self class] benchmarkRepeatCount]);
}

#pragma mark - Util
+ (NSArray *)benchmarkMethods:(NSString *) prefix {
    NSArray *methodNames = [self instanceMethodNames];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", prefix];
    NSArray *filteredMethods = [methodNames filteredArrayUsingPredicate:predicate];
    return filteredMethods;
}

+ (NSArray *)instanceMethodNames {
    NSUInteger count;
    NSMutableArray *methodNames = [NSMutableArray array];
    Method *methods = class_copyMethodList([self class], &count);
    for (NSUInteger i = 0; i < count; i++) {
        [methodNames addObject:NSStringFromSelector(method_getName(methods[i]))];
    }
    return methodNames;
}

#pragma mark - Setup

+ (void)initialize {
    [super initialize];
    [self setUpBenchmark];
    [BenchmarkTestUtil addXCTestObserver];
}


+ (void)setUpBenchmark {
    XCTestSuite *suite = [self defaultTestSuite];
    NSArray *methodNames = [self benchmarkMethods:[self benchmarkPrefix]];
    for (NSString *methodName in methodNames) {
        SEL benchmarkSelector = NSSelectorFromString(methodName);
        SEL newSelector = [self createBenchmarkSelector:benchmarkSelector];
        BenchmarkTestCase *aCase = [self testCaseWithSelector:newSelector];
        [suite addTest:aCase];
    }
}

+ (SEL)createBenchmarkSelector:(SEL) selector {
    NSString *newSelector = NSStringFromSelector(selector);
    NSString *creationMethodName = [NSString stringWithFormat:@"test_%@",
                                                              newSelector];
    SEL benchmarkSelector = NSSelectorFromString(creationMethodName);
    class_addMethod([self class], benchmarkSelector,
        [[self sharedManager] selectorForPerform:selector], "v@:");
    return benchmarkSelector;
}


- (IMP)selectorForPerform:(SEL) selector {
    IMP imp = imp_implementationWithBlock(^{
        [self performSelectorWithLoop:selector];
    });
    return imp;
}

- (void)performSelectorWithLoop:(SEL) selector {
    for (NSUInteger i = 0; i < [[self class] benchmarkRepeatCount]; i++) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:selector];
#pragma clang diagnostic pop
    }
}
@end