#
# Be sure to run `pod lib lint MeshulamSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#MeshulamSDK

Pod::Spec.new do |s|
    s.name = "MeshulamSDK"
    s.version = "0.5.4"
    s.summary = 'A short description of MeshulamSDK.'
    s.description = <<-DESC
    TODO: Add long description of the pod here.
    DESC

    s.homepage = "https://github.com/inManage/MeshulamSDK-iOS"
    s.license = { :type => 'MIT', :file => 'LICENSE' }
    s.author = { 'inmanage@gmail.com' => 'inmanage@gmail.com' }
    s.platform = :ios, '11.0'
    s.vendored_frameworks = 'MeshulamSDK.xcframework'
    # s.public_header_files = "MeshulamSDK.xcframework/Headers/*.h"
    # s.source_files = "MeshulamSDK.xcframework/Headers/*.h"
    s.source = { :git => 'https://github.com/inManage/MeshulamSDK-iOS.git', :tag => s.version.to_s }
    s.ios.deployment_target = '11.0'
    s.static_framework = true
    s.swift_version = '5.0'

    # pods
    s.dependency 'Alamofire'
    s.dependency 'lottie-ios'

    end
