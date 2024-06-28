# #
# # To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# # Run `pod lib lint qapm.podspec` to validate before publishing.
# #
Pod::Spec.new do |s|
  s.name             = 'qapm'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.subspec "QAPM" do |ss|
    ss.name         = "QAPM"
    ss.version      = "5.3.7"
    ss.summary      = "腾讯性能监控组件(iOS)"
    ss.description  = <<-DESC
                        QAPM 是一款监控线上APP的性能组件
                        DESC
    ss.homepage     = "https://cloud.tencent.com/product/qapm/"
    ss.source       = { :git => "https://github.com/TencentCloud/qapm-sdk-ios.git",:tag => "#{s.version}" }
    ss.license      = { :type => "MIT", :file => "LICENSE" }
    ss.author       = "qapm_ios"
    ss.ios.deployment_target = "8.0"
    #s.source_files = "QAPM.framework/Headers/*.h"
    #s.public_header_files  = "QAPM.framework/Headers/*.h"
    ss.requires_arc = true
    
    # s.resources = ['QAPM.framework/js_sdk.js','QAPM.framework/*.cer']
    ss.resources = ['qapm-sdk/QAPM.framework/*.bundle']
    
    ss.pod_target_xcconfig  = { 
      'ENABLE_BITCODE' => 'NO' ,
      'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
      'VALID_ARCHS' => 'arm64 x86_64 arm64e i386 armv7' 
    }
    ss.libraries = 'z', 'c++', 'resolv'
    ss.vendored_frameworks  = "qapm-sdk/QAPM.framework"
  end
end

