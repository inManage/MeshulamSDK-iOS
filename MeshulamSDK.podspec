#
# Be sure to run `pod lib lint MeshulamSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#MeshulamSDK

Pod::Spec.new do |s|

    s.name         = "MeshulamSDK"
    s.version      = "0.0.3"
    s.summary          = 'A short description of MeshulamSDK.'
    s.description  = <<-DESC
    A nice logger tool in Swift. Cheers
                     DESC
  
    s.homepage     = "https://github.com/inManage/MeshulamSDK-iOS"
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'inmanage@gmail.com' => 'inmanage@gmail.com' }
    s.ios.deployment_target = '11.0'
    s.platform = :ios, '11.0'
    s.ios.vendored_frameworks = 'MeshulamSDK.framework'
    # s.source            = { :http => 'https://s3.amazonaws.com/elasticbeanstalk-us-east-1-564874457370/NiceLogger.zip' }
    s.source           = { :git => 'https://github.com/inManage/MeshulamSDK-iOS.git', :tag => s.version.to_s }
    s.exclude_files = "Classes/Exclude"
    # s.source_files = "Bdika/**/*"

    
   # s.name             = 'MeshulamSDK'
   # s.version          = '0.0.3'
   # s.summary          = 'A short description of MeshulamSDK.'
   # s.static_framework = true
   # s.requires_arc = true
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't wors.versionry about the indent, CocoaPods strips it!
    
    #s.description      = <<-DESC
   # TODO: Add long description of the pod here.
   # DESC
    
   # s.homepage         = 'https://github.com/inManage/MeshulamSDK-iOS'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
   # s.license          = { :type => 'MIT', :file => 'LICENSE' }
   # s.author           = { 'inmanage@gmail.com' => 'inmanage@gmail.com' }
   # s.source           = { :git => 'https://github.com/inManage/MeshulamSDK-iOS.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
   # s.ios.deployment_target = '11.0'
   # s.static_framework = true
   # s.requires_arc = true
#    s.swift_version = '4.0'

  #  s.xcconfig =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  #      'ENABLE_BITCODE' => 'YES',
   #     'SWIFT_VERSION' => '4.0'
  #  }
    
   s.resources = [
   'MeshulamSDK/**/*.xcassets',
   'MeshulamSDK/**/*.storyboard',
   'MeshulamSDK/**/*.xib',
   'MeshulamSDK/**/*.png',
   'MeshulamSDK/**/*.otf',
   'MeshulamSDK/**/*.ttf',
   'MeshulamSDK/**/*.json']
    
   # s.source_files = 'MeshulamSDK/Classes/**/*'
#    s.public_header_files =  'MeshulamSDK/Classes/PublicHeaders/*.h'

    #pods
   # s.dependency 'Alamofire'
    
    # s.resource_bundles = {
    #   'MeshulamSDK' => ['MeshulamSDK/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
   
end
