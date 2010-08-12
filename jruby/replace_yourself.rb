#can jruby programs be replaced while the program is being executed?
require 'java'

puts "beginning the program"

x = java.util.Date.new

puts __FILE__
File.delete(__FILE__)

puts "ending the program"

open(__FILE__, "w") do |f|
  f.print "puts 'this was pretty cool'"
end

