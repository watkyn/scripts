require 'java'
require '/Users/Tony/.m2/repository/commons-lang/commons-lang/2.1/commons-lang-2.1.jar'

#assign the name to a constant
RandomStringUtils = org.apache.commons.lang.RandomStringUtils

puts RandomStringUtils.random(12) 
puts RandomStringUtils.random_ascii(5) 
puts RandomStringUtils.random_numeric(8) 


#using the java_import options which is similar to what we did above
java_import 'org.apache.commons.lang.math.NumberUtils'
puts NumberUtils.max([1, 45, 2, 34, 200, 89, 23].to_java :int) #example of method that needs a int[] array
puts NumberUtils.max(1, 45, 2)
puts NumberUtils.min(1, 45, 2)

#give the class name something totally up to me, sometimes useful when overlapping constants occur
java_import 'org.apache.commons.lang.time.DateUtils' do |pkg, cls|
  'DatesAreNotFun'
end
puts DatesAreNotFun.parse_date("2000-10-10", ['yyyy-MM-dd'])

