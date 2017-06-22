Pod::Spec.new do |s|
  s.name = 'RxTfL'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.version = '1.0.0'
  s.source = { :git => 'git@github.com:simonrice/RxTfL.git', :tag => 'v1.0.0' }
  s.authors = 'Simon Rice'
  s.license = 'MIT'
  s.source_files = 'RxTfL/Classes/Swaggers/**/*.swift'
  s.dependency 'RxSwift', '~> 3.0'
  s.dependency 'Alamofire', '~> 4.0'
end
