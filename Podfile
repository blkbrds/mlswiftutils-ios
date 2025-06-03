platform :ios, '14.0'
use_frameworks!
inhibit_all_warnings!

target 'PodTest' do
    pod 'SwiftUtils', :path => './'
end

target 'SwiftUtils' do
    pod 'SwiftLint'
    target 'Tests' do
        inherit! :search_paths
    end
end
