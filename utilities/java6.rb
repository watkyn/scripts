require 'rubygems'
require 'rake'

# Changes links back to what they were with the mac install
# FileUtils.ln_s Dir.glob('/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/*'), '/usr/bin', :force => true

# Changes java links to point to the CurrentJDK commands
# actually this one is not safe yet.  javaws and others are in here and we don't want to override these.
# Better would be to remove all links based on the things in the Current Commands dir and then not have force => true or something
# FileUtils.ln_s Dir.glob('/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Commands/*'), '/usr/bin', :force => true
