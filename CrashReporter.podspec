

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
s.prepare_command = <<-CMD
SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
mig -arch "i386" -header "Source/mach_exc_i386.h" -server /dev/null -user "Source/mach_exc_i386User.inc" "${SDKROOT}/usr/include/mach/mach_exc.defs"
mig -arch "x86_64" -header "Source/mach_exc_x86_64.h" -server /dev/null -user "Source/mach_exc_x86_64User.inc" "${SDKROOT}/usr/include/mach/mach_exc.defs"

echo '#ifdef __LP64__'               > Source/mach_exc.h
echo '#include "mach_exc_x86_64.h"' >> Source/mach_exc.h
echo '#else'                        >> Source/mach_exc.h
echo '#include "mach_exc_i386.h"'   >> Source/mach_exc.h
echo '#endif'                       >> Source/mach_exc.h

FILE_86=$(cat Source/mach_exc_i386User.inc)
FILE_64=$(cat Source/mach_exc_x86_64User.inc)
echo '#ifdef __LP64__'  > Source/mach_exc.c
echo "$FILE_64"        >> Source/mach_exc.c
echo '#else'           >> Source/mach_exc.c
echo "$FILE_86"        >> Source/mach_exc.c
echo '#endif'          >> Source/mach_exc.c
CMD

end
