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
2013-10-14 01:47:25.230 xctest[79268:303] benchYourTest
└ Total :0.00495s | Avg.: 0.00000s
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT