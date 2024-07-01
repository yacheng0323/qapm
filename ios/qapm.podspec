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
  s.license          = { :type => "MIT", :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => '../ios/qapm-sdk/Runner-Bridging-Header.h' } 

  # s.public_header_files = '../ios/qapm-sdk/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'
  
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # s.subspec 'QAPM' do |ss|
  #   ss.public_header_files = '../ios/qapm-sdk/**/*.h'
  #   ss.source_files = '../ios/qapm-sdk/**/*.{h,m,swift}'
  #   ss.requires_arc = true
  #   ss.resources = ['../ios/qapm-sdk/QAPM.framework/*.bundle']
  #   ss.pod_target_xcconfig  = { 
  #     'ENABLE_BITCODE' => 'NO',
  #     'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
  #     'VALID_ARCHS' => 'arm64 x86_64 arm64e i386 armv7'
  #   }
  #   ss.libraries = 'z', 'c++', 'resolv'
  #   ss.vendored_frameworks  = "../ios/qapm-sdk/QAPM.framework"
  # end

end

