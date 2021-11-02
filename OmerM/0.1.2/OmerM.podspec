Pod::Spec.new do |s|

  s.name         = "OmerM"
  s.version      = "0.1.2"
  s.summary      = "A nice logger tool in Swift."
  s.description  = <<-DESC
  A nice logger tool in Swift. Cheers
                   DESC

  s.homepage     = "https://github.com/omerm-inmanage/OmerM.git"
  s.license      = { :type => "MIT", :file => "license" }
  s.author             = { "Omer m" => "omerm@inmanage.net" }
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source  = {   :git => 'https://github.com/omerm-inmanage/OmerM.git', :tag => s.version.to_s  }
  # s.ios.vendored_frameworks = 'OmerM.framework'

  s.exclude_files = "Constrictor/Constrictor/*.plist"

   # Need to set this if you use ARC (Automatic Reference Counting)
   s.requires_arc = true
   s.static_framework = true

  s.xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
  'ENABLE_BITCODE' => 'NO'
  }

  s.resources = "OmerM/Resources/**/*.{png,jpeg,jpg,storyboard,xib,xcassets,ttf}"

  # s.source_files = 'OmerM/**/*.{h,m,swift}'
  # s.ios.exclude_files = 'OmerM/Pods'
  s.source_files  = 'OmerM/**/*.swift'
  # s.framework = "UIKit"

  # s.private_header_files = 'OmerM/**/*.Private.swift'
  # s.exclude_files = "Classes/Exclude"


  #pods
  s.dependency 'Alamofire'
  s.dependency 'lottie-ios'


end
