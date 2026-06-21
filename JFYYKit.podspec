Pod::Spec.new do |s|
  s.name         = 'JFYYKit'
  s.summary      = 'JFYYKit 封装常用iOS基础组件，包含UI、线程、缓存、图片等工具扩展'
  s.version      = '1.0.6'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'jifengs' => 'jf_feng@126.com' }
  s.homepage     = 'https://github.com/jifengs/JFYYKit'
  s.platform     = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.source       = { :git => 'https://github.com/jifengs/JFYYKit.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'JFYYKit/**/*.{h,m}'
  s.public_header_files = 'JFYYKit/**/*.{h}'

  non_arc_files = 'JFYYKit/Base/Foundation/NSObject+YYAddForARC.{h,m}',
                  'JFYYKit/Base/Foundation/NSThread+YYAdd.{h,m}'

  s.subspec 'no-arc' do |sna|
    # 关键修复：子库对齐最低iOS版本，解决模拟器编译匹配失败
    sna.platform = :ios, '10.0'
    sna.ios.deployment_target = '10.0'
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

  s.libraries = 'z', 'sqlite3'
  s.frameworks = 'UIKit', 'CoreFoundation', 'CoreText', 'CoreGraphics',
                 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary',
                 'Accelerate', 'MobileCoreServices', 'SystemConfiguration'
  s.ios.vendored_frameworks = 'Vendor/WebP.framework'

  s.resource_bundles = {
    'JFYYKit' => ['JFYYKit/PrivacyInfo.xcprivacy']
  }

  # 仅作用于当前Pod库，不污染集成项目
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  # 删除 s.user_target_xcconfig / s.xcconfig，避免全局架构冲突
end