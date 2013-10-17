# BenchmarkTestCase

XCTestCase for Benchmark.

## Installation

``` ruby
pod 'BenchmarkTestCase'
```

## Usage

``AZBenchmarkTestCase`` is subclass of XCTestCase.

```objc
@interface YourBenchmarkTestCase : AZBenchmarkTestCase

@end
@implementation YourBenchmarkTestCase
- (void)benchYourTest{
    // default: `bench` prefix is benchmark target.
    // benchmark method...
}
@end
```

### Configurable benchmark

``` objc
// benchmark method prefix
+ (NSString *)benchmarkPrefix {
    return @"time"; // default : @"bench"
}
// repeat count of benchmark method
+ (NSUInteger)benchmarkRepeatCount {
    return 100;// default : 100
}
```

### Run Benchmark

run benchmark as testCase.

Example output :

```
:Name                                              :Total(s)  :Avg(s)
-[BenchmarkAsTesting test_timePatternOne]          0.02917    0.00000
-[BenchmarkAsTesting test_timePatternTwo]          0.02792    0.00000
-[BenchmarkString test_timeCompilerPrimitive]      0.00006    0.00000
-[BenchmarkString test_timePatternNSNumber]        0.00004    0.00000
```

### Custom reporter

Set ``setDefaultReporter:(NSObject <BenchmarkReporting>*)reporter``

```objc
@interface AZBenchmarkConfig : NSObject
+ (NSObject <BenchmarkReporting> *)defaultReporter;

+ (void)setDefaultReporter:(NSObject <BenchmarkReporting>*)reporter;
@end
```

## Known Issue

Maybe Fix!

<del>First time doesn't work benchmark observer.
I don't know when to add observe ``+ (void)addXCTestObserver;`` ...</del>

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT