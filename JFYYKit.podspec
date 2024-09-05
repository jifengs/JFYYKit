Pod::Spec.new do |s|
  s.name         = 'JFYYKit'
  s.summary      = 'A collection of iOS components.'
  s.version      = '1.0.5'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'jifengs' => 'jf_feng@126.com' }
  s.homepage     = 'https://github.com/jifengs/JFYYKit.git'
  s.platform     = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => 'https://github.com/jifengs/JFYYKit.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'JFYYKit/**/*.{h,m}'
  s.public_header_files = 'JFYYKit/**/*.{h}'

  non_arc_files = 'JFYYKit/Base/Foundation/NSObject+YYAddForARC.{h,m}', 'JFYYKit/Base/Foundation/NSThread+YYAdd.{h,m}'
  s.ios.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary', 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'
  s.ios.vendored_frameworks = 'Vendor/WebP.framework'

  s.resource_bundles = {'JFYYKit' => ['JFYYKit/PrivacyInfo.xcprivacy']}

  
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
