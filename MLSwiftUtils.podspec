Pod::Spec.new do |s|
  s.name     = 'MLSwiftUtils'
  s.version  = '5.1.1'
  s.license  = 'MIT'
  s.summary  = 'MLSwiftUtils'
  s.homepage = 'https://github.com/blkbrds/mlswiftutils-ios'
  s.authors  = { 'Dai Ho V' => 'daiho' }
  s.source   = { :git => 'https://github.com/blkbrds/mlswiftutils-ios.git', :tag => s.version}
  s.requires_arc = true
  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'
  s.ios.frameworks = 'Foundation', 'UIKit'
  s.source_files = 'Sources/Helper/*.swift', 'Sources/Extensions/*.swift'
end
