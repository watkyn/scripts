require 'java'

jars = Dir.glob 'C:/work/framework-HEAD/idexx-libraries/idexx-framework/v1.6/*.jar'
jars.each do |jar_name|
  require jar_name  
end


require 'C:\work\framework-HEAD\idexx-modules\security-module\v1.6\security-module-1.6.jar'

Staff = com.idexx.security.domain.Staff

staff = Staff.new 
staff.staffId = "7897"
puts staff.staffId

#puts Staff.getProtectionDomain()
puts Staff.class.getProtectionDomain()


