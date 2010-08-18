require 'java'
require '/Users/Tony/.m2/repository/commons-lang/commons-lang/2.1/commons-lang-2.1.jar'

java_import 'org.apache.commons.lang.CharUtils'

# this is how to force method overloading to what you want
puts CharUtils.java_send(:isAscii, [Java::char], 's'[0])

#example of not using java_send
puts CharUtils.is_ascii?('s'[0])
