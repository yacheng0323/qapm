# #
# # To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# # Run `pod lib lint qapm.podspec` to validate before publishing.
# #
# Pod::Spec.new do |s|
#   s.name             = 'qapm'
#   s.version          = '0.0.1'
#   s.summary          = 'A new Flutter plugin project.'
#   s.description      = <<-DESC
# A new Flutter plugin project.
#                        DESC
#   s.homepage         = 'http://example.com'
#   s.license          = { :file => '../LICENSE' }
#   s.author           = { 'Your Company' => 'email@example.com' }
#   s.source           = { :path => '.' }
#   s.source_files = 'Classes/**/*'
#   s.dependency 'Flutter'
#   s.platform = :ios, '12.0'

#   # Flutter.framework does not contain a i386 slice.
#   s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
#   s.swift_version = '5.0'
#   s.dependency 'QAPM', '~> 5.3.5'
# end

# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name         = "qapm"
  s.version      = "5.3.7"
  s.summary      = "腾讯性能监控组件(iOS)"
  s.description  = <<-DESC
                      QAPM 是一款监控线上APP的性能组件
                      DESC
  s.homepage     = "https://cloud.tencent.com/product/qapm/"
  s.source       = { :git => "https://github.com/TencentCloud/qapm-sdk-ios.git",:tag => "#{s.version}" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "qapm_ios"
  s.ios.deployment_target = "8.0"
  #s.source_files = "QAPM.framework/Headers/*.h"
  #s.public_header_files  = "QAPM.framework/Headers/*.h"
  s.requires_arc = true
  
  # s.resources = ['QAPM.framework/js_sdk.js','QAPM.framework/*.cer']
  s.resources = ['QAPM.framework/*.bundle']
  
  s.pod_target_xcconfig  = { 
    'ENABLE_BITCODE' => 'NO' ,
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'VALID_ARCHS' => 'arm64 x86_64 arm64e i386 armv7' 
  }
  s.libraries = 'z', 'c++', 'resolv'
  s.vendored_frameworks  = "QAPM.framework"
end