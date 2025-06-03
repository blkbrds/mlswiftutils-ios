Pod::Spec.new do |s|
  s.name     = 'SwiftUtils'
  s.version  = '5.0.0'
  s.license  = 'MIT'
  s.summary  = 'SwiftUtils'
  s.homepage = 'https://github.com/tsrnd/swiftutils-ios'
  s.authors  = { 'Dai Ho' => 'daih' }
  s.source   = { :git => 'https://github.com/blkbrds/swiftutils-ios.git', :tag => s.version}
  s.requires_arc = true
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'Sources/Classes/*.swift', 'Sources/Extensions/*.swift'
end
