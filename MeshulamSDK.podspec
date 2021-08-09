#
# Be sure to run `pod lib lint MeshulamSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#MeshulamSDK

Pod::Spec.new do |s|
    
    s.name         = "MeshulamSDK"
    s.version      = "0.0.6"
    s.summary          = 'A short description of MeshulamSDK.'
    s.description      = <<-DESC
    TODO: Add long description of the pod here.
    DESC
    
    s.homepage     = "https://github.com/inManage/MeshulamSDK-iOS"
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'inmanage@gmail.com' => 'inmanage@gmail.com' }
    s.platform = :ios, '11.0'
    s.ios.vendored_frameworks = 'MeshulamSDK.framework'
    s.source           = { :git => 'https://github.com/inManage/MeshulamSDK-iOS.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '11.0'
    s.static_framework = true
    s.requires_arc = true
    s.swift_version = '4.0'
    
    s.xcconfig =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
        'ENABLE_BITCODE' => 'YES',
        'SWIFT_VERSION' => '4.0'
    }
    
    s.resources = [
    'MeshulamSDK/**/*.xcassets',
    'MeshulamSDK/**/*.storyboard',
    'MeshulamSDK/**/*.xib',
    'MeshulamSDK/**/*.png',
    'MeshulamSDK/**/*.ttf',
    'MeshulamSDK/**/*.json']
    
    
end
