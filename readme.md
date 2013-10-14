# BenchmarkTestCase

XCTestCase for Benchmark.

## Installation

``` ruby
pod 'BenchmarkTestCase',:git => 'https://github.com/azu/BenchmarkTestCase.git'
```

## Usage

```objc
@interface YourBenchmarkTestCase : BenchmarkTestCase

@end
@implementation YourBenchmarkTestCase
- (void)timeYourTest{
    // default: time prefix is benchmark target.
    // benchmark method...
}
@end
```

### Run Benchmark

run benchmark as testcase.

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
@interface BenchmarkConfig : NSObject
+ (NSObject <BenchmarkReporting> *)defaultReporter;

+ (void)setDefaultReporter:(NSObject <BenchmarkReporting>*)reporter;
@end
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT