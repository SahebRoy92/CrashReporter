

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "CrashReporter"
  s.version      = "1.0"
  s.summary      = "Symbolisation of Crashes on iOS"
  s.description  = "Symbolisation of Crashes on iOS "
  s.homepage     = "https://github.com/SahebRoy92/CrashReporter"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  # s.license      = { :type => 'Apache-2.0', :file => 'LICENSE' }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.author             = { "Saheb Roy" => "sahebroy4910@gmail.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :ios
  s.ios.deployment_target = "9.0"
  s.ios.vendored_frameworks = "CrashReporter.framework"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/SahebRoy92/CrashReporter.git", :tag => "#{s.version}" }


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  # s.requires_arc = true

    #s.dependency "SwiftyJSON"

end
