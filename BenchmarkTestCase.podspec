Pod::Spec.new do |s|

  s.name         = "BenchmarkTestCase"
  s.version      = "0.0.1"
  s.summary      = "XCTestCase for benchmark testing."
  s.homepage     = "https://github.com/azu/BenchmarkTestCase"
  s.license      = 'MIT (example)'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = { :git => "https://github.com/azu/BenchmarkTestCase.git"}

  s.source_files  = 'Lib/**/*.{h,m}'
  s.requires_arc = true
  s.framework  = 'XCTest'
end
