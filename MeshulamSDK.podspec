#
# Be sure to run `pod lib lint MeshulamSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#MeshulamSDK

Pod::Spec.new do |s|
    s.name = "MeshulamSDK"
    s.version = "0.1.18"
    s.summary = 'A short description of MeshulamSDK.'
    s.description = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage = "https://github.com/inManage/MeshulamSDK-iOS"
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.author = { 'inmanage@gmail.com' => 'inmanage@gmail.com' }
    s.platform = :ios
    s.ios.vendored_frameworks = 'MeshulamSDK.xcframework'
    s.source_files = "ios/*.{h,m,swift}"
    s.source = { :git => 'https://github.com/inManage/MeshulamSDK-iOS.git', :tag => s.version.to_s }
    # s.source = { :http => 'https://drive.google.com/file/d/1loqPggZLyGc0309IX-yxfnpJfCabu4wG/view?usp=sharing.zip', :tag => s.version.to_s  } 

    s.ios.deployment_target = '11.0'
    # s.requires_arc = true
    s.swift_version = '4.0'

    # s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    # 'ENABLE_BITCODE' => 'YES'
    # }
    
    # s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'YES' }
    # s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    # s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

    s.static_framework = true

    # s.dependency 'lottie-ios'
    s.dependency 'Alamofire'

    end
