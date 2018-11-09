Pod::Spec.new do |s|
  s.name     = 'SwiftUtils'
  s.version  = '4.2.1'
  s.license  = 'MIT'
  s.summary  = 'SwiftUtils'
  s.homepage = 'https://github.com/tsrnd/swiftutils-ios'
  s.authors  = { 'Dao Nguyen' => 'zendobk' }
  s.source   = { :git => 'https://github.com/tsrnd/swiftutils-ios.git', :tag => s.version}
  s.requires_arc = true
  s.ios.deployment_target = '8.0'  
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'Sources/Classes/*.swift', 'Sources/Extensions/*.swift'
end
